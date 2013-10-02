require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "Home page" do

    before { visit root_path }
    let(:heading)    { 'Rodney Earl' }
    let(:page_title) { '' }

    it_should_behave_like "all static pages"
    it { should_not have_title('| Home') }
  end

  describe "Work page" do
    before { visit work_path }
    let(:heading)    { 'Work Experience' }
    let(:page_title) { 'Work Experience' }

    it_should_behave_like "all static pages"
  end

  describe "Paper page" do
    before { visit papers_path }
    let(:heading)    { 'Published Papers' }
    let(:page_title) { 'Published Papers' }

    it_should_behave_like "all static pages"
  end

  describe "References page" do
    before { visit references_path }
    let(:heading)    { 'References' }
    let(:page_title) { 'References' }

    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let(:heading)    { 'Contact Me' }
    let(:page_title) { 'Contact Me' }

    it_should_behave_like "all static pages"
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "Work"
    expect(page).to have_title(full_title('Work Experience'))
    click_link "Papers"
    expect(page).to have_title(full_title('Published Papers'))
    click_link "References"
    expect(page).to have_title(full_title('References'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact Me'))
    click_link "Home"
    expect(page).to have_title(full_title(''))
  end
end
