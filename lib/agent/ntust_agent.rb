require 'rtesseract'
require_relative './mixins'

module Agent
class NtustAgent
  include Agent::Mixins

  def initialize args={}
    http_client.ssl_config.verify_mode = OpenSSL::SSL::VERIFY_NONE

    Dir.mkdir('tmp') unless Dir.exist?('tmp')

    @year = (Time.now.month.between?(1, 7) ? Time.now.year - 1 : Time.now.year)
    @term = (Time.now.month.between?(2, 7) ? 2 : 1)

    @user_agent = 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36'

    @base_url = "https://stu255.ntust.edu.tw"
  end

  def fetch studentno: nil, idcard: nil, birthday: nil, password: nil

    return if studentno.nil? || idcard.nil? || birthday.nil? || password.nil?


    10.times do
      res = http_client.get "#{@base_url}/ntust_stu/stu.aspx", nil, { 'User-Agent' => @user_agent }
      set_doc(res.content)

      # OCR 這幾乎百分百通過的驗證碼（不可質疑你的 Tesseract）
      File.write(Rails.root.join('tmp', "#{studentno}.png"), http_client.get_content("https://stu255.ntust.edu.tw/ntust_stu/VCode.aspx"))
      img = RTesseract.new(Rails.root.join('tmp', "#{studentno}.png"))
      code = img.to_s.gsub(/[^\dA-Z]/,'')

      login_res = http_client.post("#{@base_url}/ntust_stu/stu.aspx", view_state.merge({
        "studentno" => studentno,
        "idcard" => idcard,
        "birthday" => birthday,
        "password" => password,
        "code_box" => code,
        "Button1" => "登入系統",
        # "Button2"=>"登出"
      }), { 'User-Agent' => @user_agent })

      # manually follow redirection Zzzz
      menu_res = http_client.get "https://stu255.ntust.edu.tw/ntust_stu/stu_menu.aspx", nil, { 'User-Agent' => @user_agent }
      set_doc(menu_res.content)

      if menu_res.content.include?('hacker_page.aspx')
        sleep 3
      else
        break
      end
    end

    options = Hash[ @doc.css('input[type="submit"]').map{|d| [d[:name], d[:value]]} ]
    button = options.find{|k, v| v.include?("#{@year-1911}#{@term}查詢")}

    begin
      table_res = http_client.post("#{@base_url}/ntust_stu/stu_menu.aspx", view_state.merge({
        button[0] => button[1]
      }), { 'User-Agent' => @user_agent })
    rescue Exception => e
      # handle exception here, should be invalid code
      # @doc.css('#err_msg').text == "0目前線上人數過多，請稍後再行選課!!"
      # course_table_res.headers["Content-Length"].to_i == 21629
      return
    end

    course_table_res = http_client.get "https://stu255.ntust.edu.tw/ntust_stu/disp_course.aspx", nil, { 'User-Agent' => @user_agent }
    set_doc(course_table_res.content)

    course_codes = @doc.css('#c_list table#Table7 tr').map{|d| d.css('td')[0].text.strip}
  end
end
end
