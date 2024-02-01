class Document
    attr_accessor :text

    def initialize(text)
        @text = text
        puts "Document: the initial text is '#{text}'"
    end

    def changeText(newText)
        puts "Document: changing text..."
        @text = newText
        puts "Document: text was change to '#{@text}'"
    end

    def save
        ConcreteMemento.new(@text)
    end

    def restore(memento)
        @text = memento.text
        puts "Document: the text was changed to #{@text}"
    end
end

class Memento
    def name
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    def date
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
end

class ConcreteMemento < Memento
    def initialize(text)
        @text = text
        @date = Time.now.strftime('%F %T')
    end

    attr_reader :text

    def name
        "#{@date}: #{@text}"
    end

    attr_reader :date
end

class CareTaker
    def initialize(document)
        @mementos = []
        @document = document
    end

    def backup
        puts "Saving document state..."
        @mementos << @document.save
    end

    def undo
        return if @mementos.empty?

        memento = @mementos.pop
        puts "Caretaker: Restoring state to: #{memento.name}"
    end

    def showHistory
        puts "Caretaker: showing history:"
        for memento in @mementos
            puts memento.name
        end
    end
end

puts "Initializing..."
note = Document.new("If you only do what you can do, you will never be more than you are.")
careTaker = CareTaker.new(note)
careTaker.backup()
puts "\n"

puts "User: I want to change the text."
note.changeText("What you can do is just the starting point. Unfurl your hidden potential by daring to explore the unknown.")
careTaker.backup()
puts "\n"

puts "User: Nah, I don't liked it, let's change again."
note.changeText("Your capabilities are a vast, uncharted map. Unfold its secrets by boldly venturing beyond the known borders of your comfort zone.")
careTaker.backup()
puts "\n"

puts "User: I think it's not good yet."
note.changeText("Inner peace begins with letting go of the need to control everything.")
careTaker.backup()
puts "\n"

careTaker.showHistory()
puts "\n"

puts "User: I think the second one was the best."
careTaker.undo()
careTaker.undo()