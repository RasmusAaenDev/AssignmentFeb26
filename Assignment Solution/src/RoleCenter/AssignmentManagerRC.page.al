page 50102 "RAA Assignment Manager RC"
{
    PageType = RoleCenter;
    Caption = 'Assignment Manager';

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Headline RC Business Manager")
            {
                ApplicationArea = All;
            }

            part(O365Activities; "O365 Activities")
            {
                ApplicationArea = All;
            }
        }
    }
}