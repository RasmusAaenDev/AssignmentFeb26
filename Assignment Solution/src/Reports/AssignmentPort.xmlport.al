xmlport 50100 "RAA Assignment Port"
{
    Direction = Both;
    FileName = 'Assignments.xml';
    // Format = VariableText;

    schema
    {
        textelement(Root) // <Root>
        {
            XmlName = 'root';

            tableelement(Assignment; "RAA Assignment") // <Assignment>
            {
                fieldattribute(No; Assignment."No.")
                {
                }
                fieldattribute(Status; Assignment.Status)
                {
                }

                fieldelement(Title; Assignment.Title)
                {
                }
                fieldelement(Description; Assignment.Description)
                {
                }
                fieldelement(CustomerNo; Assignment."Customer No.")
                {
                }
                fieldelement(CategoryCode; Assignment."Category Code")
                {
                }
            }
        }
    }
}