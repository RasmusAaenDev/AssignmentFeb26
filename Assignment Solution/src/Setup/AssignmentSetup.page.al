page 50103 "RAA Assignment Setup"
{

    PageType = Card;
    SourceTable = "RAA Assignment Setup";
    Caption = 'Assignment Setup';
    InsertAllowed = false;
    DeleteAllowed = false;
    ApplicationArea = All;
    UsageCategory = Administration;

    AboutTitle = 'The assignment setup page';
    AboutText = 'The **assignment setup** page, handles the functionality selection of the assignment solution.';


    layout
    {
        area(content)
        {
            group(General)
            {
                AboutTitle = 'The general settings';
                AboutText = 'The general settings of the assignment solution, allow you to control the most basic functionalities of the solution.';

                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'The No. Series you select will be assigned to each new assignment you create in the assignment list.';
                }

                field("Assignment Handler"; Rec."Assignment Handler")
                {
                    ApplicationArea = All;
                    ToolTip = 'The assignment handler field specifies how the Get Data function on the assignment list imports assignment.';

                    AboutTitle = 'Assignment Handler Selection';
                    AboutText = 'The assignment handler selection will help you decide how the assignment solution handles assignment imports';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.InsertIfNotExists();
    end;

}
