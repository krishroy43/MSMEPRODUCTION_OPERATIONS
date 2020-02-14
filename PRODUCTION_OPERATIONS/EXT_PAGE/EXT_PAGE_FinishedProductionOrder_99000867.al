pageextension 50063 "Ext Finished Production Order" extends "Finished Production Order"
{
    layout
    {
        addafter("Last Date Modified")
        {
            field("Job No."; "Job No.")
            {
                ApplicationArea = All;
            }
            field("Job task No."; "Job task No.")
            {
                ApplicationArea = All;
            }
        }
    }
}