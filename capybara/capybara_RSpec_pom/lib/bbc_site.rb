require_relative 'pages/bbc_homepage'
require_relative 'pages/bbc_sign_in_page'
require_relative 'pages/bbc_signup_page'

class BbcSite

  def bbc_homepage
    BbcHomepage.new
  end

  def bbc_sign_in_page
    BbcSignInPage.new
  end

  def bbc_signup_page
    BbcSignupPage.new
  end

end
