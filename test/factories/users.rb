Factory.define :user, :class => Porter::User do |factory|
  #factory.sequence(:title) {|n| "Some Page #{n}"} 
  #factory.association :content_data, :factory => :static_page
end