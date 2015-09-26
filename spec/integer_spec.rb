require "spec_helper"
require "./to_kanji"

describe Integer do
  let(:number){}

  subject{number.to_kanji}

  context "-1" do
    let(:number){-1}
    it { expect(subject).to eq "零" }
  end
  context "0" do
    let(:number){0}
    it { expect(subject).to eq "零" }
  end
  context "1" do
    let(:number){1}
    it { expect(subject).to eq "一" }
  end
end
