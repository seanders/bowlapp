class BowlAppController < ApplicationController
  def home
    render text: self.class.angular_app
  end

  protected

  def self.angular_app
    @index_html ||= File.read(File.join(Rails.root, 'public/dist/index.html'))
  end
end
