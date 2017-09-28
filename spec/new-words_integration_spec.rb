require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('root route', {:type => :feature}) do
  it('page where user can enter a word') do
    visit('/')
    expect(page).to have_content('Ready to learn some new words?')
  end

  it('routes the user to the word they selected') do
    visit('/')
    fill_in('new_word', :with => 'calico')
    fill_in('definition', :with => 'house cat')
    click_button('Save')
    expect(page).to have_content('calico')
    Word.clear
  end
end
