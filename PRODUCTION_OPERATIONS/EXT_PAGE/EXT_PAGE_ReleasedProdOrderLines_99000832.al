pageextension 50065 "Ext Released Production Order" extends "Released Production Order"
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
        modify("Source Type")
        {
            Editable = false;
        }
    }
}