report 50100 "RAA Assignment Report"
{
    Caption = 'Assignment Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = WordLayout;

    dataset
    {
        dataitem("RAA Assignment"; "RAA Assignment")
        {

            column(No_RAAAssignment; "No.")
            {
                IncludeCaption = true;
            }
            column(Title_RAAAssignment; Title)
            {
                IncludeCaption = true;
            }
            column(Status_RAAAssignment; Status)
            {
                IncludeCaption = true;
            }
            column(CustomerNo_RAAAssignment; "Customer No.")
            {
                IncludeCaption = true;
            }
            column(CategoryCode_RAAAssignment; "Category Code")
            {
                IncludeCaption = true;
            }

            dataitem(Customer; Customer)
            {
                DataItemLink = "No." = field("Customer No.");

                column(Name_Customer; Name)
                {
                    IncludeCaption = true;
                }
                column(Address_Customer; Address)
                {
                    IncludeCaption = true;
                }
                column(PostCode_Customer; "Post Code")
                {
                    IncludeCaption = true;
                }
                column(City_Customer; City)
                {
                    IncludeCaption = true;
                }
            }
        }
    }

    rendering
    {
        layout(WordLayout)
        {
            Type = Word;
            LayoutFile = 'src/Reports/Layouts/AssignmentReport.docx';
        }

        layout(ExcelLayout)
        {
            Type = Excel;
            LayoutFile = 'src/Reports/Layouts/AssignmentReport.xlsx';
        }
    }
}