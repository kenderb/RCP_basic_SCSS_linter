# frozen_string_literal: true

require_relative '../bin/main'
RSpec.describe 'An idial scss linter' do
  let(:read_file) { ReadFile.new('./scss_test_file/sass_file.scss') }
  let(:read_file_no_paramer) { ReadFile.new(nil) }
  let(:read_file_empty) { ReadFile.new('./scss_test_file/sass_file_empty.scss') }
  let(:error_test) { ErrorChecker.new(read_file.read_scss_lines) }

  describe ' The ReadFile class' do
    describe ' The method read_scss_lines' do
      context 'when it has a content' do
        it 'lets me read the lines' do
          expect(read_file.read_scss_lines).to be_instance_of(Array)
        end
      end
      context 'when it does not has a content' do
        it 'Returns a warning' do
          expect(read_file_empty.read_scss_lines).to eq('the file is empty')
        end
      end
    end
    context 'when it has not paramer' do
      it 'return an error' do
        expect(read_file_no_paramer.file_path).to eq('no path')
      end
    end
    context 'when it does not has a content' do
      it 'Returns a warning' do
        expect(read_file_empty.read_scss_lines).to eq('the file is empty')
      end
    end
  end
  describe 'The ErrorChecker class' do
    describe 'when it has mixin' do
      it 'return the numbers of duplicated includes as an array' do
        expect(error_test.check_duplicate_includes).to eq([13, 14, 17, 18])
      end
    end
    describe "when does not has ';'" do
      it 'return the numbers of lines that does not has ";" as an array' do
        expect(error_test.check_bad_ending_atribute).to eq([9, 18])
      end
    end
    describe '' do
      it 'return the numbers of lines that does not has closing curly bracket' do
        expect(error_test.check_closing_brackets).to eq([9, 18])
      end
    end
  end
end
