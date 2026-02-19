xmlport 50101 "RAA Assignment CSV Port"
{
    Caption = 'Assignment CSV Port';
    FileName = 'Assignment.csv';
    Direction = Export;

    Format = VariableText;
    FieldDelimiter = '"';
    FieldSeparator = ';';

    schema
    {
        textelement(Root)
        {
            tableelement(Assignment; "RAA Assignment")
            {

                fieldelement(No; Assignment."No.")
                {
                }
                fieldelement(Status; Assignment.Status)
                {
                }
                fieldelement(Title; Assignment.Title)
                {
                }
                fieldelement(CategoryCode; Assignment."Category Code")
                {
                }
            }
        }
    }
}