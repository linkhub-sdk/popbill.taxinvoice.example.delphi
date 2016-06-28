unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
  Popbill, PopbillTaxinvoice, ExtCtrls;

const
        //��ũ���̵�.
        LinkID = 'TESTER';
        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Shape3: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape2: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape7: TShape;
    Shape6: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape1: TShape;
    Shape12: TShape;
    Label6: TLabel;
    Label7: TLabel;
    btnRegister: TButton;
    btnUpdate: TButton;
    btnSend: TButton;
    btnCancel_Issue: TButton;
    btnDelete: TButton;
    btnIssue: TButton;
    btnAccept: TButton;
    btnDeny: TButton;
    btnCancel_Send: TButton;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    btnGetFileList: TButton;
    btnAttachFile: TButton;
    btnDeleteFile: TButton;
    tbFileIndexID: TEdit;
    GroupBox5: TGroupBox;
    btnGetDetailInfo: TButton;
    btnGetLogs: TButton;
    btnGetInfo: TButton;
    btnGetInfos: TButton;
    GroupBox6: TGroupBox;
    btnReSendEmail: TButton;
    btnReSendSMS: TButton;
    btnSendInvoiceFax: TButton;
    tbMgtKey: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoin: TButton;
    GroupBox11: TGroupBox;
    btnGetBalance: TButton;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetPopBillURL: TButton;
    GroupBox14: TGroupBox;
    btnGetCertificateExpireDate: TButton;
    GroupBox7: TGroupBox;
    btnGetPopUpURL: TButton;
    btnGetPrintURL: TButton;
    btnGetPrintsURL: TButton;
    btnGetMailURL: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    btnCheckMgtKeyInUse: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox10: TGroupBox;
    btnGetTaxinvoiceURL1: TButton;
    btnGetTaxinvoiceURL2: TButton;
    btnGetTaxinvoiceURL3: TButton;
    btnGetTaxinvoiceURL4: TButton;
    OpenDialog1: TOpenDialog;
    cbMgtKeyType: TComboBox;
    GroupBox13: TGroupBox;
    Shape15: TShape;
    Shape16: TShape;
    Shape18: TShape;
    Shape23: TShape;
    Label5: TLabel;
    btnRegister_Reverse: TButton;
    btnUpdate_Reverse: TButton;
    btnCancelIssue_Reverse: TButton;
    btnDelete_Reverse: TButton;
    btnIssue_Reverse: TButton;
    btnCancelRequest: TButton;
    btnRequest: TButton;
    btnRefuse: TButton;
    Shape13: TShape;
    Shape14: TShape;
    Shape17: TShape;
    btnGetEmailPublicKey: TButton;
    btnSendToNTS: TButton;
    btnGetEPrintUrl: TButton;
    Button1: TButton;
    btnRegistIssue: TButton;
    btnCancelIssue: TButton;
    btnDelete_RegistIssue: TButton;
    GroupBox15: TGroupBox;
    Shape19: TShape;
    Shape20: TShape;
    GroupBox4: TGroupBox;
    GroupBox16: TGroupBox;
    Shape21: TShape;
    btnUpdateContact: TButton;
    btnRegistContact: TButton;
    btnCheckID: TButton;
    btnGetPartnerBalance: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnListContact: TButton;
    btnGetPopbillURL_CHRG: TButton;
    btnGetPopbillURL_CERT: TButton;
    btnSearchInfo: TButton;
    btnDetachStatement: TButton;
    btnAttachStatement: TButton;
    btnGetChargeInfo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetPopBillURLClick(Sender: TObject);
    procedure btnJoinClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetCertificateExpireDateClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAttachFileClick(Sender: TObject);
    procedure btnGetFileListClick(Sender: TObject);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnGetInfosClick(Sender: TObject);
    procedure btnGetLogsClick(Sender: TObject);
    procedure cbMgtKeyTypeChange(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnCancel_SendClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnDenyClick(Sender: TObject);
    procedure btnCancel_IssueClick(Sender: TObject);
    procedure btnIssueClick(Sender: TObject);
    procedure btnSendToNTSClick(Sender: TObject);
    procedure btnRequestClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnRefuseClick(Sender: TObject);
    procedure btnReSendSMSClick(Sender: TObject);
    procedure btnReSendEmailClick(Sender: TObject);
    procedure btnSendInvoiceFaxClick(Sender: TObject);
    procedure btnGetTaxinvoiceURL1Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL2Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL3Click(Sender: TObject);
    procedure btnGetTaxinvoiceURL4Click(Sender: TObject);
    procedure btnGetPopUpURLClick(Sender: TObject);
    procedure btnGetPrintURLClick(Sender: TObject);
    procedure btnGetMailURLClick(Sender: TObject);
    procedure btnGetPrintsURLClick(Sender: TObject);
    procedure btnGetEmailPublicKeyClick(Sender: TObject);
    procedure btnRegister_ReverseClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnUpdate_ReverseClick(Sender: TObject);
    procedure btnGetDetailInfoClick(Sender: TObject);
    procedure btnCheckMgtKeyInUseClick(Sender: TObject);
    procedure btnGetEPrintUrlClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnRegistIssueClick(Sender: TObject);
    procedure btnCancelIssueClick(Sender: TObject);
    procedure btnDelete_RegistIssueClick(Sender: TObject);
    procedure btnGetPopbillURL_CHRGClick(Sender: TObject);
    procedure btnGetPopbillURL_CERTClick(Sender: TObject);
    procedure btnSearchInfoClick(Sender: TObject);
    procedure btnAttachStatementClick(Sender: TObject);
    procedure btnDetachStatementClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
  private
    MgtKeyType : EnumMgtKeyType;
  public
    { Public declarations }
  end;

var
  frmExample: TfrmExample;
  taxinvoiceService : TTaxinvoiceService;
implementation

{$R *.DFM}

procedure TfrmExample.FormCreate(Sender: TObject);
begin
        MgtKeyType := SELL;
        //���ݰ�꼭 ��� �ʱ�ȭ.
        taxinvoiceService := TTaxinvoiceService.Create(LinkID,SecretKey);

        //����ȯ�� ������, true(�׽�Ʈ��), false(�����)
        taxinvoiceService.IsTest := true;
        
        //Exception ó�� ������. �̱���� true(�⺻��) 
        taxinvoiceService.IsThrowException := true;
end;

procedure TfrmExample.FormClose(Sender:TObject; var Action:TCloseAction);
begin
        taxinvoiceService.Free;
        Action := caFree;
end;

function IfThen(condition :bool; trueVal :String ; falseVal : String) : string;
begin
    if condition then result := trueVal else result := falseVal;
end;

procedure TfrmExample.btnGetPopBillURLClick(Sender: TObject);
var
  resultURL : String;
begin

        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'LOGIN');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;



procedure TfrmExample.btnJoinClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        joinInfo.LinkID := LinkID;        //��ũ���̵�
        joinInfo.CorpNum := '1231212312'; //����ڹ�ȣ '-' ����.
        joinInfo.CEOName := '��ǥ�ڼ���';
        joinInfo.CorpName := '��ȣ';
        joinInfo.Addr := '�ּ�';
        joinInfo.ZipCode := '500-100';
        joinInfo.BizType := '����';
        joinInfo.BizClass := '����';
        joinInfo.ID     := 'userid';  //6�� �̻� 20�� �̸�.
        joinInfo.PWD    := 'pwd_must_be_long_enough'; //6�� �̻� 20�� �̸�.
        joinInfo.ContactName := '����ڸ�';
        joinInfo.ContactTEL :='02-999-9999';
        joinInfo.ContactHP := '010-1234-5678';
        joinInfo.ContactFAX := '02-999-9998';
        joinInfo.ContactEmail := 'test@test.com';

        try
                response := taxinvoiceService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        taxinvoice := TTaxinvoice.Create;
        
        taxinvoice.writeDate := '20160126';             //�ʼ�, ����� �ۼ�����
        taxinvoice.chargeDirection := '������';         //�ʼ�, {������, ������}
        taxinvoice.issueType := '������';               //�ʼ�, {������, ������, ����Ź}
        taxinvoice.purposeType := '����';               //�ʼ�, {����, û��}
        taxinvoice.issueTiming := '��������';           //�ʼ�, {��������, ���ν��ڵ�����}
        taxinvoice.taxType :='����';                    //�ʼ�, {����, ����, �鼼}

        taxinvoice.invoicerCorpNum := '1234567890';              //������ ����ڹ�ȣ
        taxinvoice.invoicerTaxRegID := '';                       //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        taxinvoice.invoicerCorpName := '������ ��ȣ';
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;              //������ ����������ȣ, 1~24�ڸ� (����, ����, '-', '_'), ����ں� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';
        taxinvoice.invoicerAddr := '������ �ּ�';
        taxinvoice.invoicerBizClass := '������ ����';
        taxinvoice.invoicerBizType := '������ ����,����2';
        taxinvoice.invoicerContactName := '������ ����ڸ�';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-000-2222';
        taxinvoice.invoicerSMSSendYN := false;                    //�������(������->���޹޴���) ���ڹ߼ۿ���

        taxinvoice.invoiceeType := '�����';                     // ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeCorpNum := '8888888888';              // ���޹޴��� ����ڹ�ȣ
        taxinvoice.invoiceeTaxRegID := ''; //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';
        taxinvoice.invoiceeMgtKey := '';                         // ���޹޴��� ����������ȣ(������� �ʼ�)
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';
        taxinvoice.invoiceeBizType := '���޹޴��� ����';
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';
        taxinvoice.invoiceeEmail1 := 'test@test.com';
        taxinvoice.invoiceeTEL1 := '070-1234-1234';
        taxinvoice.invoiceeHP1 := '010-111-222';
        taxinvoice.invoiceeSMSSendYN := false; //�������(���޹޴���->������) ���ڹ߼ۿ���

        taxinvoice.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        taxinvoice.taxTotal := '10000';                 //�ʼ� ���� �հ�
        taxinvoice.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        taxinvoice.modifyCode := ''; //�������ݰ�꼭 �ۼ��� 1~6���� ���ñ���.
        taxinvoice.originalTaxinvoiceKey := ''; //�������ݰ�꼭 �ۼ��� �������ݰ�꼭�� ItemKey����. ItemKey�� ����Ȯ��.
        taxinvoice.serialNum := '123';  //�Ϸù�ȣ
        taxinvoice.cash := '';          //����
        taxinvoice.chkBill := '';       //��ǥ
        taxinvoice.note := '';          //����
        taxinvoice.credit := '';        //�ܻ�̼���
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        taxinvoice.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.

        //���׸� 0~99�� ���� �ۼ�����.
        // SerialNum �� 1���� 99���� ��������.
        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20140319';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := 'ǰ����';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := 'ǰ���';

        //�߰������ 0~5���� ���� ����.
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].serialNum := 1;
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';
        taxinvoice.addContactList[1].serialNum := 2;
        taxinvoice.addContactList[1].contactName := '�߰�����ڸ�2';

        try
                response := taxinvoiceService.Register(txtCorpNum.text,taxinvoice,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        try
                balance := taxinvoiceService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetCertificateExpireDateClick(Sender: TObject);
var
        Expired : String;
begin
        try
                Expired := taxinvoiceService.GetCertificateExpireDate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('������ ������ : '+ Expired);

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        try
                unitcost := taxinvoiceService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('���ݰ�꼭 ����ܰ� : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin
         try
                balance := taxinvoiceService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.Delete(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                response := taxinvoiceService.AttachFile(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,filePath,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        try
                filelist := taxinvoiceService.GetFiles(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'SerialNum | DisplayName | AttachedFile | RegDT' + #13;
        
        for i := 0 to Length(fileList) -1 do
        begin
            tmp := tmp +  IntToStr(fileList[i].SerialNum) + ' | ' + fileList[i].DisplayName + ' | ' + fileList[i].AttachedFile + ' | ' + fileList[i].RegDT + #13;
            tbFileIndexID.Text := fileList[i].AttachedFile;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := taxinvoiceService.DeleteFile(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,tbFileIndexID.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;
Function BoolToStr(b:Boolean):String;
begin 
    if b = true then BoolToStr:='True'; 
    if b = false then BoolToStr:='False'; 
end;
procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        taxinvoiceInfo : TTaxinvoiceInfo;
        tmp : string;
begin
        try
                taxinvoiceInfo := taxinvoiceService.getInfo(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | modifyCode | StateCode | TaxType | WriteDate | RegDT | OpenYN | OpenDT | lateIssueYN | InvoicerPrintYN | InvoiceePrintYN | TrusteePrintYN ' + #13;

        tmp := tmp + taxinvoiceInfo.ItemKey + ' | ' + taxinvoiceInfo.ModifyCode + ' | ' + IntToStr(taxinvoiceInfo.StateCode) + ' | ' + taxinvoiceInfo.TaxType + ' | '
        + taxinvoiceInfo.WriteDate + ' | ' + taxinvoiceInfo.RegDT + ' | ' + BoolToStr(taxinvoiceInfo.OpenYN) + ' | '
        + taxinvoiceInfo.OpenDT+ ' | ' + BoolToStr(taxinvoiceInfo.lateIssueYN) + ' | ' + BoolToStr(taxinvoiceInfo.InvoicerPrintYN) + ' | '
        + BoolToStr(taxinvoiceInfo.InvoiceePrintYN) + ' | ' + BoolToStr(taxinvoiceInfo.TrusteePrintYN)  + #13;

        ShowMessage(tmp);


end;

procedure TfrmExample.btnGetInfosClick(Sender: TObject);
var
        KeyList : Array of String;
        InfoList : TTaxinvoiceInfoList;
        tmp : string;
        i : Integer;
begin
        SetLength(KeyList,2);
        KeyList[0] := '20160112-01';
        KeyList[1] := '123';
        try
                InfoList := taxinvoiceService.getInfos(txtCorpNum.text,MgtKeyType,KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | StateCode | TaxType | WriteDate | RegDT | lateIssueYN | InvoicerPrintYN | InvoiceePrintYN | TrusteePrintYN' + #13;

        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].ItemKey + ' | ' + IntToStr(InfoList[i].StateCode) + ' | ' + InfoList[i].TaxType + ' | '
            + InfoList[i].WriteDate + ' | ' + InfoList[i].RegDT + ' | ' + BoolToStr(InfoList[i].lateIssueYN) + ' | '
            + BoolToStr(InfoList[i].InvoicerPrintYN)+ ' | ' + BoolToStr(InfoList[i].InvoiceePrintYN) + ' | ' + BoolToStr(InfoList[i].TrusteePrintYN) + #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TTaxinvoiceLogList;
        tmp : string;
        i : Integer;
begin
        try
                LogList := taxinvoiceService.getLogs(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'DocLogType | Log | ProcType | ProcCorpName | ProcMemo | RegDT | IP' + #13;
        
        for i := 0 to Length(LogList) -1 do
        begin
            tmp := tmp + IntToStr(LogList[i].DocLogType) + ' | '
                        + LogList[i].Log + ' | '
                        + LogList[i].ProcType + ' | '
                        + LogList[i].ProcCorpName + ' | '
                        + LogList[i].ProcMemo + ' | '
                        + LogList[i].RegDT + ' | '
                        + LogList[i].IP + ' | ' + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.cbMgtKeyTypeChange(Sender: TObject);
begin

        MgtKeyType := EnumMgtKeyType(GetEnumValue(TypeInfo(EnumMgtKeyType),cbMgtKeyType.Text));

end;

procedure TfrmExample.btnSendClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
        emailSubject : String;
begin
        memo := '���࿹�� �޸�';
        emailSubject := '';     // �ȳ����� ����, �̱���� �⺻�������� ����
        try
                response := taxinvoiceService.Send(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo,emailSubject,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnCancel_SendClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '���࿹�� ��� �޸�';
        try
                response := taxinvoiceService.CancelSend(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnAcceptClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '���࿹�� ���� �޸�';

        try
                response := taxinvoiceService.Accept(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnDenyClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '���࿹�� �ź� �޸�';
        try
                response := taxinvoiceService.Deny(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnCancel_IssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '������� �޸�';
        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
        emailSubject : String;
        forceIssue : Boolean;
begin
        memo := '����޸�';
        emailSubject := '';   // �ȳ����� ����, �̱���� �⺻�������� ����
        forceIssue := false;  // �������� ��������
        try
                response := taxinvoiceService.Issue(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo,emailSubject,forceIssue, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnSendToNTSClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.SendToNTS(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;



procedure TfrmExample.btnRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '(��)���� ��û �޸�';
        
        try
                response := taxinvoiceService.Request(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnCancelRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '(��)�����û ��� �޸�';
        try
                response := taxinvoiceService.CancelRequest(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnRefuseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '(��)�����û �ź� �޸�';
        try
                response := taxinvoiceService.Refuse(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnReSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        sendNum := '010-1111-2222';
        receiveNum := '010-222-333';
        contents := '���ݰ�꼭�� ����Ǿ����ϴ� ������ Ȯ�����ּ���.';
        try
                response := taxinvoiceService.SendSMS(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,sendNum,receiveNum,contents,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnReSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        email := 'test@test.com';  // ���Ÿ����ּ�
        try
                response := taxinvoiceService.SendEmail(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,email, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnSendInvoiceFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        sendNum := '070-111-222';       //�ѽ� �߽Ź�ȣ
        receiveNum := '090-1234-1234';    //�ѽ� ���Ź�ȣ
        
        try
                response := taxinvoiceService.SendFAX(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,sendNum,receiveNum,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;



procedure TfrmExample.btnGetTaxinvoiceURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text,txtUserID.Text,'TBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL2Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text,txtUserID.Text,'SBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL3Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text,txtUserID.Text,'PBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL4Click(Sender: TObject);
var
        resultURL : String;
begin
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text,txtUserID.Text,'WRITE');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := taxinvoiceService.getPopupURL(txtCorpNum.Text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := taxinvoiceService.getPrintURL(txtCorpNum.Text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := taxinvoiceService.getMailURL(txtCorpNum.Text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintsURLClick(Sender: TObject);
var
        KeyList : Array of String;
        resultURL : String;
begin
        SetLength(KeyList,2);
        KeyList[0] := '1234';
        KeyList[1] := '123';
        try
                resultURL := taxinvoiceService.getMassPrintURL(txtCorpNum.text,MgtKeyType,KeyList,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);

end;

procedure TfrmExample.btnGetEmailPublicKeyClick(Sender: TObject);
var
        EmailPublicKeyList : TEmailPublicKeyList;
        tmp : string;
        i  :Integer;
begin
        try
                EmailPublicKeyList := taxinvoiceService.GetEmailPublicKeys(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

         tmp := 'confirmNum | email | RegDT' + #13;
        
        for i := 0 to Length(EmailPublicKeyList) -1 do
        begin
            tmp := tmp + EmailPublicKeyList[i].confirmNum + ' | '
                        + EmailPublicKeyList[i].email + ' | '
                        + EmailPublicKeyList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnRegister_ReverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        taxinvoice := TTaxinvoice.Create;
        
        taxinvoice.writeDate := '20160126';             //�ʼ�, ����� �ۼ�����
        taxinvoice.chargeDirection := '������';         //�ʼ�, {������, ������}
        taxinvoice.issueType := '������';               //�ʼ�, {������, ������, ����Ź}
        taxinvoice.purposeType := '����';               //�ʼ�, {����, û��}
        taxinvoice.issueTiming := '��������';           //�ʼ�, {��������, ���ν��ڵ�����}
        taxinvoice.taxType :='����';                    //�ʼ�, {����, ����, �鼼}

        taxinvoice.invoicerCorpNum := '1234567890';              //������ ����ڹ�ȣ
        taxinvoice.invoicerTaxRegID := '';                       //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        taxinvoice.invoicerCorpName := '������ ��ȣ';
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;              //������ ����������ȣ, 1~24�ڸ� (����, ����, '-', '_'), ����ں� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';
        taxinvoice.invoicerAddr := '������ �ּ�';
        taxinvoice.invoicerBizClass := '������ ����';
        taxinvoice.invoicerBizType := '������ ����,����2';
        taxinvoice.invoicerContactName := '������ ����ڸ�';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-000-2222';
        taxinvoice.invoicerSMSSendYN := false;                    //�������(������->���޹޴���) ���ڹ߼ۿ���

        taxinvoice.invoiceeType := '�����';                     // ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeCorpNum := '8888888888';              // ���޹޴��� ����ڹ�ȣ
        taxinvoice.invoiceeTaxRegID := ''; //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';
        taxinvoice.invoiceeMgtKey := '';                         // ���޹޴��� ����������ȣ(������� �ʼ�)
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';
        taxinvoice.invoiceeBizType := '���޹޴��� ����';
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';
        taxinvoice.invoiceeEmail1 := 'test@test.com';
        taxinvoice.invoiceeTEL1 := '070-1234-1234';
        taxinvoice.invoiceeHP1 := '010-111-222';
        taxinvoice.invoiceeSMSSendYN := false; //�������(���޹޴���->������) ���ڹ߼ۿ��� 

        taxinvoice.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        taxinvoice.taxTotal := '10000';                 //�ʼ� ���� �հ�
        taxinvoice.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        taxinvoice.modifyCode := ''; //�������ݰ�꼭 �ۼ��� 1~6���� ���ñ���.
        taxinvoice.originalTaxinvoiceKey := ''; //�������ݰ�꼭 �ۼ��� �������ݰ�꼭�� ItemKey����. ItemKey�� ����Ȯ��.
        taxinvoice.serialNum := '123';  //�Ϸù�ȣ
        taxinvoice.cash := '';          //����
        taxinvoice.chkBill := '';       //��ǥ
        taxinvoice.note := '';          //����
        taxinvoice.credit := '';        //�ܻ�̼���
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        taxinvoice.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.

        //���׸� 0~99�� ���� �ۼ�����.
        // SerialNum �� 1���� 99���� ��������.
        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20140319';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := 'ǰ����';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := 'ǰ���';

        //�߰������ 0~5���� ���� ����.
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].serialNum := 1;
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';
        taxinvoice.addContactList[1].serialNum := 2;
        taxinvoice.addContactList[1].contactName := '�߰�����ڸ�2';

        try
                response := taxinvoiceService.Register(txtCorpNum.text,taxinvoice,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        taxinvoice := TTaxinvoice.Create;
        
        taxinvoice.writeDate := '20151210';             //�ʼ�, ����� �ۼ�����
        taxinvoice.chargeDirection := '������';         //�ʼ�, {������, ������}
        taxinvoice.issueType := '������';               //�ʼ�, {������, ������, ����Ź}
        taxinvoice.purposeType := '����';               //�ʼ�, {����, û��}
        taxinvoice.issueTiming := '��������';           //�ʼ�, {��������, ���ν��ڵ�����}
        taxinvoice.taxType :='����';                    //�ʼ�, {����, ����, �鼼}


        taxinvoice.invoicerCorpNum := '1234567890';
        taxinvoice.invoicerTaxRegID := ''; //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        taxinvoice.invoicerCorpName := '������ ��ȣ';
        taxinvoice.invoicerMgtKey := ''; //�����ÿ��� �������� �ʽ��ϴ�.
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';
        taxinvoice.invoicerAddr := '������ �ּ�';
        taxinvoice.invoicerBizClass := '������ ����';
        taxinvoice.invoicerBizType := '������ ����';
        taxinvoice.invoicerContactName := '������ ����ڸ�';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-000-2222';
        taxinvoice.invoicerSMSSendYN := true; //����� ���ڹ߼۱�� ���� Ȱ��

        taxinvoice.invoiceeType := '�����';
        taxinvoice.invoiceeCorpNum := '8888888888';
        taxinvoice.invoiceeTaxRegID := ''; //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';
        taxinvoice.invoiceeMgtKey := '';
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';
        taxinvoice.invoiceeBizType := '���޹޴��� ����';
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';
        taxinvoice.invoiceeEmail1 := 'test@invoicee.com';
        taxinvoice.invoiceeTEL1 := '070-1234-1234';

        taxinvoice.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        taxinvoice.taxTotal := '10000';                 //�ʼ� ���� �հ�
        taxinvoice.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        taxinvoice.modifyCode := ''; //�������ݰ�꼭 �ۼ��� 1~6���� ���ñ���.
        taxinvoice.originalTaxinvoiceKey := ''; //�������ݰ�꼭 �ۼ��� �������ݰ�꼭�� ItemKey����. ItemKey�� ����Ȯ��.
        taxinvoice.serialNum := '123';
        taxinvoice.cash := '';          //����
        taxinvoice.chkBill := '';       //��ǥ
        taxinvoice.note := '';          //����
        taxinvoice.credit := '';        //�ܻ�̼���
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        taxinvoice.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.
        taxinvoice.faxreceiveNum := '';         //����� Fax�߼۱�� ���� ���Ź�ȣ ����.
        taxinvoice.faxsendYN := false;          //����� Fax�߼۽� ����.



        //���׸� 0~99�� ���� �ۼ�����.
        // SerialNum �� 1���� 99���� ��������.
        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 3);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;
        taxinvoice.detailList[0].purchaseDT := '20140319';
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';
        taxinvoice.detailList[0].unitCost := '100000';
        taxinvoice.detailList[0].supplyCost := '100000';
        taxinvoice.detailList[0].tax := '10000';
        taxinvoice.detailList[0].remark := 'ǰ����';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := 'ǰ���';

        taxinvoice.detailList[2] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[2].serialNum := 3;
        taxinvoice.detailList[2].itemName := '������ ǰ���';

        //�߰������ 0~5���� ���� ����.
        SetLength(taxinvoice.addContactList,1);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';

        try
                response := taxinvoiceService.Update(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, taxinvoice,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnUpdate_ReverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        taxinvoice := TTaxinvoice.Create;
        
        taxinvoice.writeDate := '20151210';             //�ʼ�, ����� �ۼ�����
        taxinvoice.chargeDirection := '������';         //�ʼ�, {������, ������}
        taxinvoice.issueType := '������';               //�ʼ�, {������, ������, ����Ź}
        taxinvoice.purposeType := '����';               //�ʼ�, {����, û��}
        taxinvoice.issueTiming := '��������';           //�ʼ�, {��������, ���ν��ڵ�����}
        taxinvoice.taxType :='����';                    //�ʼ�, {����, ����, �鼼}

        taxinvoice.invoicerCorpNum := '8888888888';
        taxinvoice.invoicerTaxRegID := ''; //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        taxinvoice.invoicerCorpName := '������ ��ȣ';
        taxinvoice.invoicerMgtKey := '';  //������ÿ��� ���޹޴��ںκп� ����.
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';
        taxinvoice.invoicerAddr := '������ �ּ�';
        taxinvoice.invoicerBizClass := '������ ����';
        taxinvoice.invoicerBizType := '������ ����';
        taxinvoice.invoicerContactName := '������ ����ڸ�';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-000-2222';
        taxinvoice.invoicerSMSSendYN := true; //����� ���ڹ߼۱�� ���� Ȱ��

        taxinvoice.invoiceeType := '�����';
        taxinvoice.invoiceeCorpNum := '1234567890';
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';
        taxinvoice.invoiceeMgtKey := tbMgtKey.Text; //������ÿ��� �ʼ�����.
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';
        taxinvoice.invoiceeBizType := '���޹޴��� ����';
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';
        taxinvoice.invoiceeEmail1 := 'test@invoicee.com';

        taxinvoice.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        taxinvoice.taxTotal := '10000';                 //�ʼ� ���� �հ�
        taxinvoice.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        taxinvoice.modifyCode := ''; //�������ݰ�꼭 �ۼ��� 1~6���� ���ñ���.
        taxinvoice.originalTaxinvoiceKey := ''; //�������ݰ�꼭 �ۼ��� �������ݰ�꼭�� ItemKey����. ItemKey�� ����Ȯ��.
        taxinvoice.serialNum := '123';
        taxinvoice.cash := '';          //����
        taxinvoice.chkBill := '';       //��ǥ
        taxinvoice.note := '';          //����
        taxinvoice.credit := '';        //�ܻ�̼���
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        taxinvoice.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.
        taxinvoice.faxreceiveNum := '';         //����� Fax�߼۱�� ���� ���Ź�ȣ ����.
        taxinvoice.faxsendYN := false;          //����� Fax�߼۽� ����.

        //���׸� 0~99�� ���� �ۼ�����.
        // SerialNum �� 1���� 99���� ��������.
        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 3);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;
        taxinvoice.detailList[0].purchaseDT := '20140319';
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';
        taxinvoice.detailList[0].unitCost := '100000';
        taxinvoice.detailList[0].supplyCost := '100000';
        taxinvoice.detailList[0].tax := '10000';
        taxinvoice.detailList[0].remark := 'ǰ����';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := 'ǰ���';

        taxinvoice.detailList[2] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[2].serialNum := 3;
        taxinvoice.detailList[2].itemName := '������ ǰ���';

        //�߰������ 0~5���� ���� ����.
        SetLength(taxinvoice.addContactList,1);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';

        try
                response := taxinvoiceService.Update(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, taxinvoice,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        tmp : string;
        i : integer;
begin
        try
                taxinvoice := taxinvoiceService.getDetailInfo(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := tmp +'writeDate : ' +  taxinvoice.WriteDate + #13;
        tmp := tmp +'chargeDirection : ' +  taxinvoice.ChargeDirection + #13;
        tmp := tmp +'issueType : ' +  taxinvoice.IssueType + #13;
        tmp := tmp +'issueTiming : ' +  taxinvoice.IssueTiming + #13;
        tmp := tmp +'taxType : ' +  taxinvoice.TaxType + #13;

        tmp := tmp +'invoicerCorpNum : ' +  taxinvoice.InvoicerCorpNum + #13;
        tmp := tmp +'invoicerMgtKey : ' +  taxinvoice.InvoicerMgtKey + #13;
        tmp := tmp +'invoicerTaxRegID : ' +  taxinvoice.InvoicerTaxRegID + #13;
        tmp := tmp +'invoicerCorpName : ' +  taxinvoice.InvoicerCorpName + #13;
        tmp := tmp +'invoicerCEOName : ' +  taxinvoice.InvoicerCEOName + #13;
        tmp := tmp +'invoicerAddr : ' +  taxinvoice.InvoicerAddr + #13;
        tmp := tmp +'invoicerBizClass : ' +  taxinvoice.InvoicerBizClass + #13;
        tmp := tmp +'invoicerBizType : ' +  taxinvoice.InvoicerBizType + #13;
        tmp := tmp +'invoicerContactName : ' +  taxinvoice.InvoicerContactName + #13;
        tmp := tmp +'invoicerDeptName : ' +  taxinvoice.InvoicerDeptName + #13;
        tmp := tmp +'invoicerTEL : ' +  taxinvoice.InvoicerTEL + #13;
        tmp := tmp +'invoicerHP : ' +  taxinvoice.InvoicerHP + #13;
        tmp := tmp +'invoicerEmail : ' +  taxinvoice.InvoicerEmail + #13;
        tmp := tmp +'invoicerSMSSendYN : ' +  IfThen(taxinvoice.InvoicerSMSSendYN,'true','false') + #13;

        tmp := tmp +'invoiceeCorpNum : ' +  taxinvoice.InvoiceeCorpNum + #13;
        tmp := tmp +'invoiceeMgtKey : ' +  taxinvoice.InvoiceeMgtKey + #13;
        tmp := tmp +'invoiceeTaxRegID : ' +  taxinvoice.InvoiceeTaxRegID + #13;
        tmp := tmp +'invoiceeCorpName : ' +  taxinvoice.InvoiceeCorpName + #13;
        tmp := tmp +'invoiceeCEOName : ' +  taxinvoice.InvoiceeCEOName + #13;
        tmp := tmp +'invoiceeAddr : ' +  taxinvoice.InvoiceeAddr + #13;
        tmp := tmp +'invoiceeBizClass : ' +  taxinvoice.InvoiceeBizClass + #13;
        tmp := tmp +'invoiceeBizType : ' +  taxinvoice.InvoiceeBizType + #13;
        tmp := tmp +'invoiceeContactName1 : ' +  taxinvoice.InvoiceeContactName1 + #13;
        tmp := tmp +'invoiceeDeptName1 : ' +  taxinvoice.InvoiceeDeptName1 + #13;
        tmp := tmp +'invoiceeTEL1 : ' +  taxinvoice.InvoiceeTEL1 + #13;
        tmp := tmp +'invoiceeHP1 : ' +  taxinvoice.InvoiceeHP1 + #13;
        tmp := tmp +'invoiceeEmail1 : ' +  taxinvoice.InvoiceeEmail1 + #13;
        tmp := tmp +'invoiceeSMSSendYN : ' +  IfThen(taxinvoice.InvoiceeSMSSendYN,'true','false') + #13;

        tmp := tmp +'trusteeCorpNum : ' +  taxinvoice.trusteeCorpNum + #13;
        tmp := tmp +'trusteeMgtKey : ' +  taxinvoice.trusteeMgtKey + #13;
        tmp := tmp +'trusteeTaxRegID : ' +  taxinvoice.trusteeTaxRegID + #13;
        tmp := tmp +'trusteeCorpName : ' +  taxinvoice.trusteeCorpName + #13;
        tmp := tmp +'trusteeCEOName : ' +  taxinvoice.trusteeCEOName + #13;
        tmp := tmp +'trusteeAddr : ' +  taxinvoice.trusteeAddr + #13;
        tmp := tmp +'trusteeBizClass : ' +  taxinvoice.trusteeBizClass + #13;
        tmp := tmp +'trusteeBizType : ' +  taxinvoice.trusteeBizType + #13;
        tmp := tmp +'trusteeContactName : ' +  taxinvoice.trusteeContactName + #13;
        tmp := tmp +'trusteeDeptName : ' +  taxinvoice.trusteeDeptName + #13;
        tmp := tmp +'trusteeTEL : ' +  taxinvoice.trusteeTEL + #13;
        tmp := tmp +'trusteeHP : ' +  taxinvoice.trusteeHP + #13;
        tmp := tmp +'trusteeEmail : ' +  taxinvoice.trusteeEmail + #13;
        tmp := tmp +'trusteeSMSSendYN : ' +  IfThen(taxinvoice.trusteeSMSSendYN,'true','false') + #13;

        tmp := tmp +'taxTotal : ' +  taxinvoice.taxTotal + #13;
        tmp := tmp +'supplyCostTotal : ' +  taxinvoice.supplyCostTotal + #13;
        tmp := tmp +'totalAmount : ' +  taxinvoice.totalAmount + #13;

        tmp := tmp +'modifyCode : ' +  taxinvoice.modifyCode + #13;

        tmp := tmp +'orgNTSConfirmNum : ' +  taxinvoice.orgNTSConfirmNum + #13;
        tmp := tmp +'purposeType : ' +  taxinvoice.purposeType + #13;
        tmp := tmp +'serialNum : ' +  taxinvoice.serialNum + #13;

        tmp := tmp +'cash : ' +  taxinvoice.cash + #13;
        tmp := tmp +'chkBill : ' +  taxinvoice.chkBill + #13;
        tmp := tmp +'credit : ' +  taxinvoice.credit + #13;
        tmp := tmp +'note : ' +  taxinvoice.note + #13;

        tmp := tmp +'remark1 : ' +  taxinvoice.remark1 + #13;
        tmp := tmp +'remark2 : ' +  taxinvoice.remark2 + #13;
        tmp := tmp +'remark3 : ' +  taxinvoice.remark3 + #13;

        tmp := tmp +'kwon : ' +  taxinvoice.kwon + #13;
        tmp := tmp +'ho : ' +  taxinvoice.ho + #13;

        tmp := tmp +'businessLicenseYN : ' +  IfThen(taxinvoice.businessLicenseYN,'true','false') + #13;
        tmp := tmp +'bankBookYN : ' +  IfThen(taxinvoice.bankBookYN,'true','false') + #13;
        tmp := tmp +'faxsendYN : ' +  IfThen(taxinvoice.fAXSendYN,'true','false') + #13;

        tmp := tmp +'faxreceiveNum : ' +  taxinvoice.fAXReceiveNum + #13;
        tmp := tmp +'ntsconfirmNum : ' +  taxinvoice.nTSConfirmNum + #13;
        tmp := tmp +'originalTaxinvoiceKey : ' +  taxinvoice.originalTaxinvoiceKey + #13;

        tmp := tmp + '-----���׸�-----' + #13;
        
        for i:= 0 to Length(taxinvoice.detailList)-1 do
        begin
            tmp := tmp + IntToStr(taxinvoice.detailList[i].serialNum) + ' | ' +
                         taxinvoice.detailList[i].purchaseDT + ' | ' +
                         taxinvoice.detailList[i].itemName + ' | ' +
                         taxinvoice.detailList[i].spec + ' | ' +
                         taxinvoice.detailList[i].qty + ' | ' +
                         taxinvoice.detailList[i].unitCost + ' | ' +
                         taxinvoice.detailList[i].supplyCost + ' | ' +
                         taxinvoice.detailList[i].tax + ' | ' +
                         taxinvoice.detailList[i].remark + #13 ;

        end;

        tmp := tmp + '-----�߰������-----' + #13;
        for i:= 0 to Length(taxinvoice.AddContactList)-1 do
        begin
            tmp := tmp + IntToStr(taxinvoice.AddContactList[i].serialNum) + ' | ' +
                         taxinvoice.AddContactList[i].email + ' | ' +
                         taxinvoice.AddContactList[i].contactName + #13 ;

        end;
        ShowMessage(tmp);
end;

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        try
                InUse := taxinvoiceService.CheckMgtKeyInUse(txtCorpNum.text,MgtKeyType,tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        if InUse then ShowMessage('�����') else ShowMessage('�� �����.');
end;


procedure TfrmExample.btnGetEPrintUrlClick(Sender: TObject);
var
  resultURL : String;
begin
        try
                resultURL := taxinvoiceService.getEPrintURL(txtCorpNum.Text,MgtKeyType,tbMgtKey.Text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.Button1Click(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := taxinvoiceService.CheckIsMember(txtCorpNum.text,LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        try
                response := taxinvoiceService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);

end;


procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        try
                corpInfo := taxinvoiceService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName : ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        corpInfo := TCorpInfo.Create;

        corpInfo.ceoname := '��ǥ�ڸ�';         // ��ǥ�ڸ�
        corpInfo.corpName := '�˺�';    // ȸ���
        corpInfo.bizType := '����';             // ����
        corpInfo.bizClass := '����';            // ����
        corpInfo.addr := '����Ư���� ������ ������� 517';  // �ּ�
        
        try
                response := taxinvoiceService.UpdateCorpInfo(txtCorpNum.text,corpInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin

        try
                InfoList := taxinvoiceService.ListContact(txtCorpNum.text,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;
        tmp := 'id | email | hp | personName | searchAllAlloyYN | tel | fax | mgrYN | regDT' + #13;
        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].id + ' | ';
            tmp := tmp + InfoList[i].email + ' | ';
            tmp := tmp + InfoList[i].hp + ' | ';
            tmp := tmp + InfoList[i].personName + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].searchAllAllowYN) + ' | ';
            tmp := tmp + InfoList[i].tel + ' | ';
            tmp := tmp + InfoList[i].fax + ' | ';
            tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
            tmp := tmp + InfoList[i].regDT + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        joinInfo.id := 'userid';                        // [�ʼ�] ���̵� (6�� �̻� 20�� �̸�)
        joinInfo.pwd := 'thisispassword';               // [�ʼ�] ��й�ȣ (6�� �̻� 20�� �̸�)
        joinInfo.personName := '����ڼ���';            // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 30�� �̳�)
        joinInfo.tel := '070-7510-3710';                // [�ʼ�] ����ó
        joinInfo.hp := '010-1111-2222';                 // �޴�����ȣ
        joinInfo.fax := '02-6442-9700';                 // �ѽ���ȣ
        joinInfo.email := 'test@test.com';              // [�ʼ�] �̸���
        joinInfo.searchAllAllowYN := false;             // ��ȸ����(true ȸ����ȸ/ false ������ȸ)
        joinInfo.mgrYN     := false;                    // ������ ���ѿ��� 

        try
                response := taxinvoiceService.RegistContact(txtCorpNum.text,joinInfo,txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        contactInfo := TContactInfo.Create;

        contactInfo.personName := '�׽�Ʈ �����';      // ����ڸ�
        contactInfo.tel := '070-7510-3710';             // ����ó
        contactInfo.hp := '010-4324-1111';              // �޴�����ȣ
        contactInfo.email := 'test@test.com';           // �̸��� �ּ�
        contactInfo.fax := '02-6442-9799';              // �ѽ���ȣ
        contactInfo.searchAllAllowYN := true;           // ��ȸ����, true(ȸ����ȸ), false(������ȸ)
        contactInfo.mgrYN := false;                     // �����ڱ��� �������� 

        try
                response := taxinvoiceService.UpdateContact(txtCorpNum.text,contactInfo,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnRegistIssueClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
        writeSpecification : Boolean;
        forceIssue : Boolean;
        memo : String;
        emailSubject : String;
        dealInvoiceMgtKey : String;
begin
        writeSpecification := false;     // �ŷ����� �����ۼ� ����
        dealInvoiceMgtKey := '';        // �ŷ����� �����ۼ��� ���� ����������ȣ, 1~24�ڸ� ����,����,'-','_' �������� ����
        forceIssue := false;            // �������� ��������
        memo := '��ù��� �޸�';        // �޸�
        emailSubject := '';             // ���� �ȳ����� ����, �̱���� �⺻�������� ����

        taxinvoice := TTaxinvoice.Create;

        taxinvoice.writeDate := '20160126';             //�ʼ�, ����� �ۼ�����
        taxinvoice.chargeDirection := '������';         //�ʼ�, {������, ������}
        taxinvoice.issueType := '������';               //�ʼ�, {������, ������, ����Ź}
        taxinvoice.purposeType := '����';               //�ʼ�, {����, û��}
        taxinvoice.issueTiming := '��������';           //�ʼ�, {��������, ���ν��ڵ�����}
        taxinvoice.taxType :='����';                    //�ʼ�, {����, ����, �鼼}

        taxinvoice.invoicerCorpNum := '1234567890';              //������ ����ڹ�ȣ
        taxinvoice.invoicerTaxRegID := '';                       //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�.
        taxinvoice.invoicerCorpName := '������ ��ȣ';
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;              //������ ����������ȣ, 1~24�ڸ� (����, ����, '-', '_'), ����ں� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';
        taxinvoice.invoicerAddr := '������ �ּ�';
        taxinvoice.invoicerBizClass := '������ ����';
        taxinvoice.invoicerBizType := '������ ����,����2';
        taxinvoice.invoicerContactName := '������ ����ڸ�';
        taxinvoice.invoicerEmail := 'test@test.com';
        taxinvoice.invoicerTEL := '070-7070-0707';
        taxinvoice.invoicerHP := '010-123-111';
        taxinvoice.invoicerSMSSendYN := false;                    //�������(������->���޹޴���) ���ڹ߼ۿ���

        taxinvoice.invoiceeType := '�����';                     // ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeCorpNum := '8888888888';              // ���޹޴��� ����ڹ�ȣ
        taxinvoice.invoiceeTaxRegID := ''; //������� �ĺ���ȣ. �ʿ�� ����. ������ ���� 4�ڸ�
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';
        taxinvoice.invoiceeMgtKey := '';                         // ���޹޴��� ����������ȣ(������� �ʼ�)
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';
        taxinvoice.invoiceeBizType := '���޹޴��� ����';
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';
        taxinvoice.invoiceeEmail1 := 'test@test.com';
        taxinvoice.invoiceeHP1 := '010-111-222';
        taxinvoice.invoiceeTEL1 := '070-1234-1234';
        taxinvoice.invoiceeSMSSendYN := false;           //�������(���޹޴���->������) ���ڹ߼ۿ��� 

        taxinvoice.supplyCostTotal := '100000';         //�ʼ� ���ް��� �հ�
        taxinvoice.taxTotal := '10000';                 //�ʼ� ���� �հ�
        taxinvoice.totalAmount := '110000';             //�ʼ� �հ�ݾ�.  ���ް��� + ����

        taxinvoice.modifyCode := '';                    //�������ݰ�꼭 �ۼ��� 1~6���� ���ñ���.
        taxinvoice.originalTaxinvoiceKey := '';         //�������ݰ�꼭 �ۼ��� �������ݰ�꼭�� ItemKey����. ItemKey�� ����Ȯ��.
        taxinvoice.serialNum := '123';  //�Ϸù�ȣ
        taxinvoice.cash := '';          //����
        taxinvoice.chkBill := '';       //��ǥ
        taxinvoice.note := '';          //����
        taxinvoice.credit := '';        //�ܻ�̼���
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';
        taxinvoice.kwon := '1';
        taxinvoice.ho := '1';

        taxinvoice.businessLicenseYN := false; //����ڵ���� �̹��� ÷�ν� ����.
        taxinvoice.bankBookYN := false ;        //����纻 �̹��� ÷�ν� ����.

        //���׸� 0~99�� ���� �ۼ�����.
        // SerialNum �� 1���� 99���� ��������.
        //SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20140319';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := 'ǰ����';


        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;
        taxinvoice.detailList[1].itemName := 'ǰ���';

        //�߰������ 0~5���� ���� ����.
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';
        taxinvoice.addContactList[0].serialNum := 1;
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';
        taxinvoice.addContactList[1].serialNum := 2;
        taxinvoice.addContactList[1].contactName := '�߰�����ڸ�2';

        try
                response := taxinvoiceService.RegistIssue(txtCorpNum.text,taxinvoice,writeSpecification,forceIssue,memo,emailSubject,dealInvoiceMgtKey,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;


        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnCancelIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        memo := '������� �޸�';

        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnDelete_RegistIssueClick(Sender: TObject);
var
        response : TResponse;
begin
       try
                response := taxinvoiceService.Delete(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message)
end;

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin

        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopbillURL_CERTClick(Sender: TObject);
var
  resultURL : String;
begin

        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text,txtUserID.Text,'CERT');
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnSearchInfoClick(Sender: TObject);
var
        DType : String;
        SDate : String;
        EDate : String;
        State : Array Of String;
        TType : Array Of String;
        TaxType : Array Of String;
        LateOnly : String;
        TaxRegIDYN : String;
        TaxRegIDType : String;
        TaxRegID : Array Of String;
        Page : Integer;
        PerPage : Integer;
        Order : String;
        tmp : String;
         SearchList : TSearchList;
        i : Integer;
begin

        DType := 'W';           // [�ʼ�] �������� { R : ����Ͻ�, W : �ۼ�����, I : �����Ͻ� } �� ����
        SDate := '20160501';    // [�ʼ�] ��������, �ۼ�����(yyyyMMdd)
        EDate := '20160701';    // [�ʼ�] ��������, �ۼ�����(yyyyMMdd)

        SetLength(State, 2);    // ���ۻ��°� �迭. �̱���� ��ü ������ȸ, �������� �� 3�ڸ��� �迭, 2,3��°�ڸ� ���ϵ�ī�� ��밡��
        State[0] := '3**';         // <���߰��̵�> "����(����)��꼭 �����ڵ�"  http://blog.linkhub.co.kr/372/
        State[1] := '6**';

        SetLength(TType,2);     // �������� �迭. {N:�Ϲ�, M:����} ���ñ���, �̱���� ��ü��ȸ
        TType[0] := 'N';
        TType[1] := 'M';

        SetLength(TaxType,3);   // ��������. {T:����, N:�鼼, Z:����} ���ñ���, �̱���� ��ü��ȸ
        TaxType[0] := 'T';
        TaxType[1] := 'Z';
        TaxType[2] := 'N';

        LateOnly := '';         // �������࿩��. {���� : ��ü��ȸ, 0 : ���������ȸ, 1 : �������� ��ȸ} ���ñ���

        TaxRegIDType := 'S';    // ��������ȣ ����� ����, S-������, B-���޹޴���, T-��Ź��

        SetLength(TaxRegID,1);  // ������� ��ȣ �迭
        TaxRegID[0] := '';

        TaxRegIDYN := '';      // ������� ����, {����-��ü��ȸ, 0-��������ȣ ���¹��� ��ȸ, 1-�˻����ǿ� ���� ��ȸ} ���ñ���

        Page := 1;              // ��������ȣ, �⺻�� 1
        PerPage := 50;          // �������� �˻�����, �⺻�� 500, �ִ� 1000

        Order := 'D';           // 'D' : �������� , 'A' : ��������

        try
                SearchList := taxinvoiceService.search(txtCorpNum.text,MgtKeyType,DType,SDate,EDate,State,TType,TaxType,LateOnly,TaxRegIDType,TaxRegID,TaxRegIDYN,Page,PerPage,Order);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'code : '+IntToStr(SearchList.code) + #13;
        tmp := tmp + 'total : '+ IntToStr(SearchList.total) + #13;
        tmp := tmp + 'perPage : '+ IntToStr(SearchList.perPage) + #13;
        tmp := tmp + 'pageNum : '+ IntToStr(SearchList.pageNum) + #13;
        tmp := tmp + 'pageCount : '+ IntToStr(SearchList.pageCount) + #13;
        tmp := tmp + 'message : '+ SearchList.message + #13#13;

        tmp := tmp + 'WriteDate | invoicerMgtKey | StateCode | TaxType |  RegDT | lateIssueYN | invoicerCorpNum |  invoicerCorpName | invoiceeCorpNum | invoiceeCorpName | '
                + ' issueType | supplyCostTotal | taxTotal | invoicerPrintYN | invoiceePrintYN | trusteePrintYN '+#13#13;

        for i := 0 to Length(SearchList.list) -1 do
        begin
            tmp := tmp + SearchList.list[i].WriteDate + ' | '
                        + SearchList.list[i].InvoicerMgtKey  + ' | '
                        + IntToStr(SearchList.list[i].StateCode) + ' | '
                        + SearchList.list[i].TaxType + ' | '
                        + SearchList.list[i].RegDT + ' | '
                        + BoolToStr(SearchList.list[i].lateIssueYN) + ' | '
                        + SearchList.list[i].invoicerCorpNum + ' | '
                        + SearchList.list[i].invoicerCorpname + ' | '
                        + SearchList.list[i].invoiceeCorpNum + ' | '
                        + SearchList.list[i].invoiceeCorpname + ' | '
                        + SearchList.list[i].issueType + ' | '
                        + SearchList.list[i].supplyCostTotal + ' | '
                        + SearchList.list[i].taxTotal + ' | '
                        + BoolToStr(SearchList.list[i].InvoicerPrintYN) + ' | '
                        + BoolToStr(SearchList.list[i].InvoiceePrintYN) + ' | '
                        + BoolToStr(SearchList.list[i].TrusteePrintYN) + ' | ' + #13;
        end;

        SearchList.Free;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnAttachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        SubItemCode := 121;             // ÷���� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubMgtKey := '20151223-01';     // ÷���� ���ڸ��� ����������ȣ

        try
                response := taxinvoiceService.AttachStatement(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,SubItemCode,SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        SubItemCode := 121;             // ÷�������� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubMgtKey := '20151223-01';     // ÷�������� ���ڸ��� ����������ȣ
        
        try
                response := taxinvoiceService.DetachStatement(txtCorpNum.text,MgtKeyType,tbMgtKey.Text,SubItemCode,SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TTaxinvoiceChargeInfo;
        tmp : String;
begin

        try
                chargeInfo := taxinvoiceService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage(IntToStr(le.code) + ' | ' +  le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);
end;

end.
