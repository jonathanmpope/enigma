# Enigma Project Self Evaluation

### Functionality

My Enigma project meets expectations. It can encrypt, decrypt, and all command line functions work properly. It can deal with things like numbers, symbols, and upper case letters without losing functionality. The decrypt method will autogenerate a date and key if none is provided. The key will maintain leading zeros if a lower number is generated.

### Object Oriented Programming

My program is broken down into **five** classes, each with a distinct set of responsibilities. All classes are less than 100 lines of code and interact throughout the Enigma program, while still encapsulating data and methods. For example, my **Message** class methods that are utilized during encryption and decryption live in the message class. If a method acts on an object, it lives in that class. Each class interacts, but has a specific job.

### Ruby Conventions and Mechanics

My code is easy to read and understand. All methods are 7 lines of code or less. Helper methods are used to break up longer chains of logic, making the code easier to read and understand. Spacing and indentation is consistent throughout all classes and spec files.

I created a hash using the **zip** enumerable (combining two arrays) and that assigns letters in the message to their index position. This hash is then used in my encryption and decryption logic to reduce complexity.
```ruby
  def message_hash(message)
    letter_array = message.downcase.chars
    indexes = Array(0..letter_array.size - 1)
    Hash[indexes.zip letter_array]
  end
```

I also used **map** in both my *encryption* and *decryption* processes to reduce code length.
```ruby
def encryption_process(shift)
  @encryption_message = @broken_up.map { |index, letter| encryption_logic(shift, index, letter) }
  @encryption_message.join("")
end
```

### Test Driven Development

All methods are both unit and integration tested. I tested for outliers such as capital letters, symbols, and numbers during encryption and decryption. Both the date generator and random digit method also meet requirements and were tested thoroughly.

Coverage according to **simplecov** is 100%. I used mocks and stubs in a few instances as well as a 'mock' file to test my file reading method. All tests were written prior to code implementation.

```ruby
it 'creates the shift' do
  key = double("key", num: "01552", a_key: "01", b_key: "15", c_key: "55", d_key: "52")
  offset = double("offset", a_key: "2", b_key: "4", c_key: "6", d_key: "4")
  expect(@shift.create_shift(key, offset)).to eq("3196156")
end
```

![](https://drive.google.com/file/d/1HUxLTHg2xCWs0DE2shPNbaMku9k6xgmC/view?usp=sharing)
