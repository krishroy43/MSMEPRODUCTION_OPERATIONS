pageextension 50067 "Ext. Production Journal" extends "Production Journal"
{

    layout
    {


        addafter("Shortcut Dimension 2 Code")
        {
            field("Job No."; "Job No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Job Task No."; "Job Task No.")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }

    }
}