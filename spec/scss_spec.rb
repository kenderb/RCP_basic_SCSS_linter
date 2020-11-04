require_relative '../bin/main'
RSpec.describe 'An idial scss linter' do
  let(:read_file) { ReadFile.new('./scss_test_file/sass_file.scss') }
  let(:read_file_no_paramer) { ReadFile.new(nil) }
  let(:read_file_empty) { ReadFile.new('./scss_test_file/sass_file_empty.scss') }
  let(:mixin_test) { ErrorChecker.new(read_file.read_scss_lines) }

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
    describe ' The method mixin_checker' do
      context 'when it has mixin' do
        it 'return true' do
          expect(mixin_test.mixin_checker).to eq(true)
        end
      end
      context 'when it does not has a content' do
        it 'Returns a warning' do
          expect(read_file_empty.read_scss_lines).to eq('the file is empty')
        end
      end
    end
  end
end
