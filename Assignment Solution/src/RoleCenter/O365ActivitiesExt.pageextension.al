pageextension 50100 "RAA O365 Activities Ext" extends "O365 Activities"
{
    layout
    {
        addlast(content)
        {
            cuegroup(AssignmentsGroup)
            {
                Caption = 'Assignments';
                field(Assignments; Rec.Assignments)
                {
                    Caption = 'All';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assignments field.', Comment = '%';
                }
                field("Incomplete Assignments"; Rec."Incomplete Assignments")
                {
                    Caption = 'Incomplete';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Incomplete Assignments field.', Comment = '%';
                }
                field("Completed Assignments"; Rec."Completed Assignments")
                {
                    Caption = 'Completed';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Completed Assignments field.', Comment = '%';
                }
            }
        }
    }
}