class FindYourTrnController < ApplicationController
  include Wizardry

  wizard(
    name: :trn_search,
    class_name: "Search",
    edit_path_helper: :trn_edit_path,
    update_path_helper: :trn_update_path,
    pages: [
      Wizardry::Pages::QuestionPage.new(
        :do_you_have_a_trn,
        title: 'Do you have a TRN?',
        questions: [
          Wizardry::Questions::Radios.new(:do_you_have_a_trn, "1" => "Yes", "0" => "No")
        ]
      ),
    ]
  )
end
