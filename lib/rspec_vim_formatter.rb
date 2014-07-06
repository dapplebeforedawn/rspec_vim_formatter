require 'rspec/core/formatters/base_text_formatter'

class RspecVimFormatter < RSpec::Core::Formatters::BaseTextFormatter

  def example_failed example
    exception = example.execution_result[:exception]
    return unless path = extract_path(exception)

    message = format_message exception.message
    path    = format_caller(path)
    output.puts "#{path}: #{example.example_group.description.strip}" +
      "#{example.description.strip}: #{message.strip}"
  end

  def example_pending *args;  end
  def dump_failures *args; end
  def dump_pending *args; end
  def message msg; end
  def dump_summary *args; end
  def seed *args; end

private

  def format_message msg
    msg.gsub("\n", ' ')[0,80]
  end

  def extract_path exception
    exception.backtrace.each do |frame|
      case frame
      when %r{\b(spec/.*_spec\.rb:\d+)(?::|\z)}
        return $1
      when %r{\b(app/.*\.rb:\d+)(?::|\z)}
        return $1
      end
    end
  end

end
