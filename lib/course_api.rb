require 'httpclient'

module CourseAPI
  class << self

    # 先隨便串一下
    def import course_codes: nil, user_id: nil
      user = User.find(user_id)
      organization_code = user.organization_code

      courses_taken = JSON.parse(clnt.get_content("https://colorgy.io:443/api/v1/user_courses.json?filter[user_id]=#{user_id}&filter[year]=#{current_year}&filter[term]=#{current_term}&#{token_param(user)}"))

      courses_mapped = get_courses(course_codes, user)

      courses_taken_codes = courses_taken.map{|c| c["course_code"]}
      codes_union = courses_taken_codes | courses_mapped.map{|c| c["code"]}
      import_codes = codes_union - courses_taken_codes

      # pending here
      # 需要匯入的課程就有...
      import_courses = courses_mapped.select{ |c| import_codes.include?(c["code"]) }
      import_courses.each do |course|
        clnt.post(
          "https://colorgy.io:443/api/v1/me/user_courses.json?#{token_param(user)}",
          {
            'user_courses[course_code]': course["code"],
            'user_courses[course_organization_code]': organization_code,
            'user_courses[year]': current_year,
            'user_courses[term]': current_term,
            'user_courses[uuid]': SecureRandom.uuid
          }
        )
      end
    end

    def get_courses course_codes, user
      org_code = user.organization_code && user.organization_code.downcase || "ntust"

      course_codes.map { |gc|
        JSON.parse(clnt.get_content("https://colorgy.io:443/api/v1/#{org_code}/courses.json?filter[general_code]=#{gc}&filter[year]=#{current_year}&filter[term]=#{current_term}&#{token_param(user)}"))[0]
      }.reject(&:blank?)
    end

    def token_param user
      "access_token=#{user.core_access_token}"
    end

    def current_year
      (Time.now.month.between?(1, 7) ? Time.now.year - 1 : Time.now.year)
    end

    def current_term
      (Time.now.month.between?(2, 7) ? 2 : 1)
    end

    def clnt
      @http_client ||= HTTPClient.new
    end
  end
end
