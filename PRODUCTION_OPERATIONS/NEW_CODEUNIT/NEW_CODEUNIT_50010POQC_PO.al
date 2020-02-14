codeunit 50010 "POQC PO"
{

    [EventSubscriber(ObjectType::Codeunit, 99000787, 'OnAfterInitProdOrderLine', '', false, false)]
    procedure OnAfterInitProdOrderLine_LT(VAR ProdOrderLine: Record "Prod. Order Line";
                                            ProdOrder: Record "Production Order")
    begin
        ProdOrderLine.Validate("Job No.", ProdOrder."Job No.");
        ProdOrderLine.Validate("Job task No.", ProdOrder."Job task No.");
    end;

    /*
    While posting Production Journal 
    */
    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterInsertItemLedgEntry', '', false, false)]
    procedure OnAfterInsertItemLedgEntry_LT(VAR ItemLedgerEntry: Record "Item Ledger Entry";
                                             ItemJournalLine: Record "Item Journal Line";
                                        VAR ItemLedgEntryNo: Integer;
                                        VAR ValueEntryNo: Integer;
                                        VAR ItemApplnEntryNo: Integer)
    begin
        ItemLedgerEntry.Validate("Job No.", ItemJournalLine."Job No.");
        ItemLedgerEntry.Validate("Job Task No.", ItemJournalLine."Job Task No.");
    end;



    /*
        Inserting Job and Job Task No. Line for Output Line in Item Journal Line Table
    */
    [EventSubscriber(ObjectType::Codeunit, 5510, 'OnBeforeInsertOutputJnlLine', '', false, false)]
    procedure OnBeforeInsertOutputJnlLine_LT(VAR ItemJournalLine: Record "Item Journal Line";
                                             ProdOrderRtngLine: Record "Prod. Order Routing Line";
                                             ProdOrderLine: Record "Prod. Order Line")
    begin
        ItemJournalLine.Validate("Job No.", ProdOrderLine."Job No.");
        ItemJournalLine.Validate("Job Task No.", ProdOrderLine."Job task No.");
    end;


    /*
       Inserting Job and Job Task No. Line for Consumption Line in Item Journal Line Table
    */
    [EventSubscriber(ObjectType::Codeunit, 5510, 'OnBeforeInsertConsumptionJnlLine', '', false, false)]
    procedure OnBeforeInsertConsumptionJnlLine_LT(VAR ItemJournalLine: Record "Item Journal Line";
                                                  ProdOrderComp: Record "Prod. Order Component";
                                                  ProdOrderLine: Record "Prod. Order Line";
                                                  Level: Integer)
    begin
        ItemJournalLine.Validate("Job No.", ProdOrderLine."Job No.");
        ItemJournalLine.Validate("Job Task No.", ProdOrderLine."Job task No.");
    end;

    procedure CopyFromJobDimensionToReleaseProductionOrder(JobNoP: Code[20]): Integer
    var
        DefaultDimensionRecL: Record "Default Dimension";
        DimensionSetEntryRecL: Record "Dimension Set Entry" temporary;
        DimensionValueRecL: Record "Dimension Value";
        DimensionManagementCU: Codeunit DimensionManagement;
    begin
        DefaultDimensionRecL.Reset();
        DefaultDimensionRecL.SetCurrentKey("Table ID", "No.", "Dimension Code");
        DefaultDimensionRecL.SetRange("Table ID", Database::Job);
        DefaultDimensionRecL.SetRange("No.", JobNoP);
        if DefaultDimensionRecL.FindSet() then begin
            repeat
                DimensionSetEntryRecL.Init();
                DimensionSetEntryRecL.Validate("Dimension Code", DefaultDimensionRecL."Dimension Code");
                DimensionSetEntryRecL.Validate("Dimension Value Code", DefaultDimensionRecL."Dimension Value Code");

                DimensionValueRecL.Reset();
                DimensionValueRecL.SetRange("Dimension Code", DefaultDimensionRecL."Dimension Code");
                DimensionValueRecL.SetRange(Code, DefaultDimensionRecL."Dimension Value Code");
                if DimensionValueRecL.FindFirst() then
                    DimensionSetEntryRecL.Validate("Dimension Value ID", DimensionValueRecL."Dimension Value ID");

                if DimensionSetEntryRecL.Insert() then;
            until DefaultDimensionRecL.Next() = 0;
        end;
        exit(DimensionManagementCU.GetDimensionSetID(DimensionSetEntryRecL));
    end;

}