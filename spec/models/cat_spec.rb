require 'rails_helper'

RSpec.describe Cat, type: :model do
  it 'should validate name' do
    cat = Cat.create(
      age: 24,
      enjoys: 'Loves to lift weights and does not rerack the weights.',
      image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
    )
    # if cat's name field is empty, we need to check that an error is thrown
    expect(cat.errors[:name]).to_not be_empty
    expect(cat.errors[:name]).to eq ["can't be blank"]
  end

  it 'should have an age' do
    cat = Cat.create(
      name: 'Panthro',
      enjoys: 'Loves to lift weights and does not rerack the weights.',
      image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
    )
    expect(cat.errors[:age]).to_not be_empty
    expect(cat.errors[:age]).to eq ["can't be blank"]
  end

  it 'should enjoy something' do
    cat = Cat.create(
      name: 'Panthro',
      age: 24,
      image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
    )
    expect(cat.errors[:enjoys]).to_not be_empty
    expect(cat.errors[:enjoys]).to eq ["can't be blank", "is too short (minimum is 10 characters)"]
  end
  
  it 'should have a image' do
    cat = Cat.create(
      name: 'Panthro',
      age: 24,
      enjoys: 'Loves to lift weights and does not rerack the weights.',
    )
    expect(cat.errors[:image]).to_not be_empty
    expect(cat.errors[:image]).to eq ["can't be blank"]
  end

  it "'enjoys' should be 10 characters long" do
    cat = Cat.create(
      name: 'Panthro',
        age: 24,
        enjoys: 'runs alot',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end
end
