require_relative '../bin/main'
RSpec.describe 'An idial scss linter' do
  let(:read_file) { ReadFile.new('./scss_test_file/sass_file.scss') }
  let(:read_file_no_paramer) { ReadFile.new(nil) }
  let(:read_file_enty) { ReadFile.new('./scss_test_file/sass_file_empty.scss') }
  describe ' The ReadFile class' do
    describe ' The method read_scss_lines' do
      context 'when it has a content' do
        it 'lets me read the lines' do
          expect(read_file.read_scss_lines).to be_instance_of(Array)
        end
      end
      context 'when it does not has a content' do
        it 'Returns a warning' do
          expect(read_file_enty.read_scss_lines).to eq('the file is empty')
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
        expect(read_file_enty.read_scss_lines).to eq('the file is empty')
      end
    end
  end
end
