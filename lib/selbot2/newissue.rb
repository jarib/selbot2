module Selbot2
  class NewIssue
    include Cinch::Plugin

    HELPS << [":newissue", "Link to create a new issue for Selenium"]
    HELPS << [":ci webdriver", "Link to create a new issue for a specific WebDriver"]

    CHROME = 'https://goo.gl/GLqBrm'.freeze
    GECKO = 'https://goo.gl/B81m26'.freeze
    MARIONETTE = 'https://goo.gl/qZembo'.freeze
    EDGE = 'https://goo.gl/IagI9v'.freeze
    SELENIUM = "#{Selbot2::REPO}/issues/new/choose".freeze
    SAFARI = 'https://goo.gl/lEKZEM'.freeze
    HTMLUNIT = 'https://goo.gl/iXUl9F'.freeze
    SPEC = 'https://goo.gl/rSgQF7'.freeze
    IDE = 'https://goo.gl/RJqjRr'.freeze

    match /newissue\s?(\w*)/

    def execute(m, webdriver)
      webdriver = webdriver.strip if webdriver

      case webdriver
        when /chrome(driver)?/
          message = "Submit a new issue with Chromedriver -- #{CHROME}"
        when /gecko(driver)?/
          message = "Submit a new issue with Geckodriver -- #{GECKO}"
        when /marionet+e/
          message = "Submit a new issue with Marionette -- #{MARIONETTE}"
        when /edge(driver)?/
          message = "Submit a new issue with Microsoft (Edge) Webdriver -- #{EDGE}"
        when /safari(driver)?/
          message = "Submit a new issue with Safaridriver -- #{SAFARI}"
        when /html(unit)?\-?(driver)?/
          message = "Submit a new issue with HtmlUnitDriver -- #{HTMLUNIT}"
        when /ide/
          message = "Submit a new issue with Selenium IDE 2 -- #{IDE}"
        when /spec/
          message = "Submit a new issue with W3C WebDriver Specification -- #{SPEC}"
        else
          message = "Submit a new issue with the Selenium project -- #{SELENIUM}"
      end
      m.reply message
    end

  end # NewIssue
end # Selbot2
