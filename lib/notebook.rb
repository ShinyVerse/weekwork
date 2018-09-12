class NoteBook
  attr_reader :list
  def initialize
    @list = []
  end

  def new_note(title, body)
    note = Note.new(title, body)
    formatted_note = note.formatter
    list << formatted_note
  end

  def add_tag(existing_note, tag)
    existing_note[:tag] = tag
  end

  def has_tag?(existing_note, tag_value)
    if existing_note.has_key?(:tag)
      existing_note[:tag] == tag_value
    end
  end

  def print_specific_tag(collection, tag_value)
    collection.select { |entry| has_tag?(entry, tag_value)}
  end
end


class Note
  attr_reader :title, :body
 def initialize(title = nil, body = nil)
   @body = body
   @title = title
 end
 def formatter
   {title: title, body: body}
 end
end
