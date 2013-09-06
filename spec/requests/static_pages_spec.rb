require 'spec_helper'

describe "StaticPages" do
  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading) { Rblog::APP_SHORT_NAME }
    let(:page_title) {''}

    #it { should have_content(Rblog::APP_SHORT_NAME)}
    #it { should have_title(full_title(''))}
    it_should_behave_like 'all static pages'
    it { should_not have_title('| Home')}

  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit help_path
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page).to have_title('Help')
    end

  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit about_path
      expect(page).to have_content('About')
    end

    it "should have the title 'About Us'" do
      visit about_path
      expect(page).to have_title('About')
    end

  end

  describe "Contact Page" do

    it "should have the selector H1 with content 'Contact'" do
      visit contact_path
      expect(page).to have_selector('h1', text: 'Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page).to have_title('Contact')
    end

  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About'))
    all('a').select {|elt| elt.text == "Help" }.first.click
    expect(page).to have_title(full_title('Help'))
    all('a').select {|elt| elt.text == "Contact" }.first.click
    expect(page).to have_title(full_title('Contact'))
    all('a').select {|elt| elt.text == "Home" }.first.click
    expect(page).to have_title(full_title(''))
    click_link Rblog::APP_SHORT_NAME
    expect(page).to have_title(full_title(''))
  end

end
