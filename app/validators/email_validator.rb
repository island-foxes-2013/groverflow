# Custom validation for assuring that email address is valid
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless valid?(value)
      record.errors[attribute] << (options[:message] || "is not a valid email address")
    end
  end

  # Use the mailgun api to verify the client submitted email is correct. Documentation can be found here: http://documentation.mailgun.com/api-email-validation.html
  def valid?(email)
    email = "address=" + email
    response = RestClient.get "https://api:pubkey-2-5pezoadgsxe0stc4bidm2cq417n-p5"\
    "@api.mailgun.net/v2/address/validate?#{email}"
    mailgun_response = JSON.parse(response) # mailgun returns a string, convert to json
    mailgun_response["is_valid"] == "true" #check the hash for true (valid email) or false (invalid email) and return boolean result
  end

end
