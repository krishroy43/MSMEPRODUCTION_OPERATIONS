pageextension 50061 "Ext Planned Production Order" extends "Planned Production Order"
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