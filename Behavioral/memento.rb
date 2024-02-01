class Document
    attr_acessor: text

    def initialize(text)
        @text = text
        puts "Document: the initial text is '#{text}'"
    end

    def changeText(newText)
        puts "Document: changing text..."
        @text = text
        puts "Document: text was change to '#{text}'"
    end

    def save
        ConcreteMemento.save(@text)
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

    attr_reader: state

    def name
        "#{@date}: #{@state}"
    end

    attr_reader: date
end
