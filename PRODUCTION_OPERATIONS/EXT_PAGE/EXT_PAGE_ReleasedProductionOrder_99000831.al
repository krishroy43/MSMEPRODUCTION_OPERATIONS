pageextension 50066 "Ext Released Prod. Order Lines" extends "Released Prod. Order Lines"
{
    layout
    {
        addafter("Cost Amount")
        {
            field("Job No."; "Job No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Job task No."; "Job task No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

}



// page 50555 "Dim Set E"
// {
//     PageType = List;
//     SourceTable = "Dimension Set Entry";
// }