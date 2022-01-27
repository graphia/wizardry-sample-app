class FindYourTrnController < ApplicationController
  include Wizardry

  wizard(
    name: :find_your_trn,
    class_name: "Search",
    edit_path_helper: :trn_edit_path,
    update_path_helper: :trn_update_path,
    pages: [
      Wizardry::Pages::QuestionPage.new(
        :do_you_have_a_trn,
        title: "Do you have a TRN?",
        questions: [
          Wizardry::Questions::Radios.new(:do_you_have_a_trn, "1" => "Yes", "0" => "No")
        ],
        pages: [
          # Note, this is a question page rather than an exit, the router
          # should be updated to redirect to an arbitrary path
          Wizardry::Pages::QuestionPage.new(
            :you_can_get_one,
            title: "Request a TRN",
            questions: [],
          ),
        ],
        next_pages: [
          Wizardry::Routing::NextPage.new(:you_can_get_one, proc { |s| !s.do_you_have_a_trn? }, label: %(Has TRN?))
        ]
      ),
      Wizardry::Pages::QuestionPage.new(
        :what_is_your_name,
        title: "What is your name?",
        questions: [
          Wizardry::Questions::ShortAnswer.new(:name)
        ]
      ),
      Wizardry::Pages::QuestionPage.new(
        :what_is_your_date_of_birth,
        title: "What is your date of birth?",
        questions: [
          Wizardry::Questions::Date.new(:date_of_birth)
        ]
      ),
      Wizardry::Pages::QuestionPage.new(
        :where_should_we_send_your_trn,
        title: "Where should we send your TRN?",
        questions: [
          Wizardry::Questions::ShortAnswer.new(:email)
        ]
      ),
      Wizardry::Pages::CheckYourAnswersPage.new(
        title: "Check your answers",
        questions: [
          Wizardry::Questions::Hidden.new(:complete, true)
        ]
      ),
      Wizardry::Pages::CompletionPage.new
    ]
  )
end
