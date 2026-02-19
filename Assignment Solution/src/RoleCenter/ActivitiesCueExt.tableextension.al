tableextension 50100 "RAA Activities Cue Ext" extends "Activities Cue"
{
    fields
    {
        field(50100; "Assignments"; Integer)
        {
            Caption = 'Assignments';
            FieldClass = FlowField;
            CalcFormula = count("RAA Assignment");
        }
        field(50101; "Incomplete Assignments"; Integer)
        {
            Caption = 'Incomplete Assignments';
            FieldClass = FlowField;
            CalcFormula = count("RAA Assignment" where(Status = const(Incomplete)));
        }
        field(50102; "Completed Assignments"; Integer)
        {
            Caption = 'Completed Assignments';
            FieldClass = FlowField;
            CalcFormula = count("RAA Assignment" where(Status = const(Completed)));
        }
    }
}