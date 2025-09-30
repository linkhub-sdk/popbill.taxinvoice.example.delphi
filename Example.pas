{******************************************************************************
{
{ �˺� ���ڼ��ݰ�꼭 API Delphi SDK Example
{ Delphi ���� Ʃ�丮�� �ȳ� : https://developers.popbill.com/guide/taxinvoice/delphi/getting-started/tutorial
{
{ ������Ʈ ���� : 2024-02-27
{ ����������� ����ó : 1600-9854
{ ����������� �̸��� : code@linkhubcorp.com
{
{ <�׽�Ʈ �������� �غ����>
{ 1) API Key ���� (������û �� ���Ϸ� ���޵� ����)
{    - LinkID : ��ũ��꿡�� �߱��� ��ũ���̵�
{    - SecretKey : ��ũ��꿡�� �߱��� ���Ű
{ 2) SDK ȯ�漳�� �ɼ� ����
{    - IsTest : ����ȯ�� ����, true-�׽�Ʈ, false-�(Production), (�⺻��:true)
{    - IsThrowException : ���� ó�� ����, true-���, false-�̻��, (�⺻��:true)
{    - IPRestrictOnOff : ������ū IP ���� ����, true-���, false-�̻��, (�⺻��:true)
{    - UseLocalTimeYN : ���ýý��� �ð� ��뿩��, true-���, false-�̻��, (�⺻��:true)
{ 3) ���ڼ��ݰ�꼭 ������ ���� ������������ ����մϴ�.
{    - �˺�����Ʈ �α��� > [���ڼ��ݰ�꼭] > [ȯ�漳��] > [���������� ����]
{    - ���������� ��� �˾� URL (GetTaxCertURL API)�� �̿��Ͽ� ���
{
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, shellapi,
  Popbill, PopbillTaxinvoice, ExtCtrls;

const

        // ��ũ���̵�
        LinkID = 'TESTER';

        // ���Ű
        SecretKey = 'SwWxqU+0TErBXy/9TVjIPEnI0VTUMMSQZtJf3Ed8q3I=';

type
  TfrmExample = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Shape11: TShape;
    Shape2: TShape;
    Shape9: TShape;
    Shape7: TShape;
    Shape1: TShape;
    Label6: TLabel;
    btnRegister: TButton;
    btnUpdate: TButton;
    btnCancelIssue_sub: TButton;
    btnDelete_sub: TButton;
    btnIssue: TButton;
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
    btnSendEmail: TButton;
    btnSendSMS: TButton;
    btnSendFax: TButton;
    tbMgtKey: TEdit;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    btnJoinMember: TButton;
    GroupBox11: TGroupBox;
    btnGetUnitCost: TButton;
    GroupBox12: TGroupBox;
    btnGetAccessURL: TButton;
    GroupBox14: TGroupBox;
    btnGetCertificateExpireDate: TButton;
    txtCorpNum: TEdit;
    Label3: TLabel;
    btnCheckMgtKeyInUse: TButton;
    Label4: TLabel;
    txtUserID: TEdit;
    GroupBox10: TGroupBox;
    btnGetURL1: TButton;
    btnGetURL2: TButton;
    btnGetURL3: TButton;
    btnGetURL4: TButton;
    OpenDialog1: TOpenDialog;
    cbMgtKeyType: TComboBox;
    GroupBox13: TGroupBox;
    Shape15: TShape;
    Shape16: TShape;
    Shape18: TShape;
    Shape23: TShape;
    Label5: TLabel;
    btnRegister_reverse: TButton;
    btnUpdate_reverse: TButton;
    btnCancelIssue_reverse_sub: TButton;
    btnDelete_reverse_sub: TButton;
    btnIssue_reverse_sub: TButton;
    btnCancelRequest_sub: TButton;
    btnRequest: TButton;
    btnRefuse_sub2: TButton;
    Shape14: TShape;
    Shape17: TShape;
    btnGetEmailPublicKey: TButton;
    btnSendToNTS: TButton;
    btnCheckIsMember: TButton;
    btnRegistIssue: TButton;
    btnCancelIssue: TButton;
    btnDelete: TButton;
    GroupBox15: TGroupBox;
    Shape19: TShape;
    Shape20: TShape;
    GroupBox4: TGroupBox;
    GroupBox16: TGroupBox;
    Shape21: TShape;
    btnUpdateContact: TButton;
    btnRegistContact: TButton;
    btnCheckID: TButton;
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnListContact: TButton;
    btnSearch: TButton;
    btnDetachStatement: TButton;
    btnAttachStatement: TButton;
    btnGetChargeInfo: TButton;
    btnGetSealURL: TButton;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    btnGetBalance: TButton;
    btnGetChargeURL: TButton;
    btnGetPartnerBalance: TButton;
    btnGetTaxCertURL: TButton;
    btnGetPartnerURL: TButton;
    btnAssignMgtKey: TButton;
    btnCheckCertValidation: TButton;
    btnListEmailConfig: TButton;
    btnUpdateEmailConfig: TButton;
    GroupBox7: TGroupBox;
    btnGetPopUpURL: TButton;
    btnGetPrintURL: TButton;
    btnGetMassPrintURL: TButton;
    btnGetMailURL: TButton;
    btnGetEPrintUrl: TButton;
    btnRegistRequest: TButton;
    GroupBox19: TGroupBox;
    btnIssue_reverse: TButton;
    btnCancelIssue_reverse: TButton;
    btnCancelRequest: TButton;
    btnRefuse: TButton;
    btnDelete_reverse: TButton;
    Shape22: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Shape27: TShape;
    Shape28: TShape;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    Shape30: TShape;
    Shape31: TShape;
    StaticText1: TStaticText;
    Shape5: TShape;
    btnGetViewURL: TButton;
    btnGetPDFURL: TButton;
    btnGetOldPrintURL: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
    btnGetXML: TButton;
    Button1: TButton;
    btnGetSendToNTSConfig: TButton;
    GroupBox22: TGroupBox;
    Button2: TButton;
    Label7: TLabel;
    txtSubmitID: TEdit;
    btnGetBulkResult: TButton;
    btnGetURL5: TButton;
    btnGetURL6: TButton;
    txtURL: TEdit;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action:TCloseAction);
    procedure btnGetAccessURLClick(Sender: TObject);
    procedure btnJoinMemberClick(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnGetBalanceClick(Sender: TObject);
    procedure btnGetCertificateExpireDateClick(Sender: TObject);
    procedure btnGetUnitCostClick(Sender: TObject);
    procedure btnGetPartnerBalanceClick(Sender: TObject);
    procedure btnDelete_subClick(Sender: TObject);
    procedure btnAttachFileClick(Sender: TObject);
    procedure btnGetFileListClick(Sender: TObject);
    procedure btnDeleteFileClick(Sender: TObject);
    procedure btnGetInfoClick(Sender: TObject);
    procedure btnGetInfosClick(Sender: TObject);
    procedure btnGetLogsClick(Sender: TObject);
    procedure cbMgtKeyTypeChange(Sender: TObject);
    procedure btnCancelIssue_subClick(Sender: TObject);
    procedure btnIssueClick(Sender: TObject);
    procedure btnSendToNTSClick(Sender: TObject);
    procedure btnRequestClick(Sender: TObject);
    procedure btnCancelRequest_subClick(Sender: TObject);
    procedure btnRefuse_sub2Click(Sender: TObject);
    procedure btnSendSMSClick(Sender: TObject);
    procedure btnSendEmailClick(Sender: TObject);
    procedure btnSendFaxClick(Sender: TObject);
    procedure btnGetURL1Click(Sender: TObject);
    procedure btnGetURL2Click(Sender: TObject);
    procedure btnGetURL3Click(Sender: TObject);
    procedure btnGetURL4Click(Sender: TObject);
    procedure btnGetURL5Click(Sender: TObject);
    procedure btnGetURL6Click(Sender: TObject);
    procedure btnGetPopUpURLClick(Sender: TObject);
    procedure btnGetPrintURLClick(Sender: TObject);
    procedure btnGetOldPrintURLClick(Sender: TObject);
    procedure btnGetMailURLClick(Sender: TObject);
    procedure btnGetMassPrintURLClick(Sender: TObject);
    procedure btnGetEmailPublicKeyClick(Sender: TObject);
    procedure btnRegister_reverseClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnUpdate_reverseClick(Sender: TObject);
    procedure btnGetDetailInfoClick(Sender: TObject);
    procedure btnGetXMLClick(Sender: TObject);
    procedure btnCheckMgtKeyInUseClick(Sender: TObject);
    procedure btnGetEPrintUrlClick(Sender: TObject);
    procedure btnCheckIsMemberClick(Sender: TObject);
    procedure btnCheckIDClick(Sender: TObject);
    procedure btnGetCorpInfoClick(Sender: TObject);
    procedure btnUpdateCorpInfoClick(Sender: TObject);
    procedure btnListContactClick(Sender: TObject);
    procedure btnRegistContactClick(Sender: TObject);
    procedure btnUpdateContactClick(Sender: TObject);
    procedure btnRegistIssueClick(Sender: TObject);
    procedure btnCancelIssueClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnGetChargeURLClick(Sender: TObject);
    procedure btnGetTaxCertURLClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnAttachStatementClick(Sender: TObject);
    procedure btnDetachStatementClick(Sender: TObject);
    procedure btnGetChargeInfoClick(Sender: TObject);
    procedure btnGetSealURLClick(Sender: TObject);
    procedure btnGetPartnerURLClick(Sender: TObject);
    procedure btnAssignMgtKeyClick(Sender: TObject);
    procedure btnCheckCertValidationClick(Sender: TObject);
    procedure btnListEmailConfigClick(Sender: TObject);
    procedure btnUpdateEmailConfigClick(Sender: TObject);
    procedure btnRegistRequestClick(Sender: TObject);
    procedure btnIssue_reverseClick(Sender: TObject);
    procedure btnCancelIssue_reverseClick(Sender: TObject);
    procedure btnRefuseClick(Sender: TObject);
    procedure btnCancelRequestClick(Sender: TObject);
    procedure btnDelete_reverseClick(Sender: TObject);
    procedure btnGetViewURLClick(Sender: TObject);
    procedure btnGetPDFURLClick(Sender: TObject);
    procedure btnGetSendToNTSConfigClick(Sender: TObject);
    procedure btnGetPaymentURLClick(Sender: TObject);
    procedure btnGetUseHistoryURLClick(Sender: TObject);
    procedure btnGetContactInfoClick(Sender: TObject);
    procedure btnGetTaxCertInfoClick(Sender: TObject);
    procedure btnBulkSubmitClick(Sender: TObject);
    procedure btnGetBulkResultClick(Sender: TObject);


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

        // ���ݰ�꼭 ��� �ʱ�ȭ.
        taxinvoiceService := TTaxinvoiceService.Create(LinkID,SecretKey);

        // ����ȯ�� ����, true-�׽�Ʈ, false-�(Production), (�⺻��:true)
        taxinvoiceService.IsTest := true;

        // ���� ó�� ����, true-���, false-�̻��, (�⺻��:true)
        taxinvoiceService.IsThrowException := true;

        // ������ū IP ���� ����, true-���, false-�̻��, (�⺻��:true)
        taxinvoiceService.IPRestrictOnOff := true;

        // ���ýý��� �ð� ��뿩��, true-���, false-�̻��, (�⺻��:true)
        taxinvoiceService.UseLocalTimeYN := false;
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

Function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

procedure TfrmExample.btnIssue_reverseClick(Sender: TObject);
var
        response : TIssueResponse;
        memo : String;
        emailSubject : String;
        forceIssue : Boolean;
begin
        {**********************************************************************}
        { "�ӽ�����" �Ǵ� "(��)������" ������ ���ݰ�꼭�� ����(���ڼ���)�ϸ�, "����Ϸ�" ���·� ó���մϴ�.
        { - ���ݰ�꼭 ����û ������å [https://developers.popbill.com/guide/taxinvoice/delphi/introduction/policy-of-send-to-nts]
        { - "����Ϸ�" �� ���ڼ��ݰ�꼭�� ����û ���� ������ �������(CancelIssue API) �Լ��� ����û �Ű� ��󿡼� ������ �� �ֽ��ϴ�.
        { - ���ݰ�꼭 ������ ���ؼ� �������� �������� �˺� ���������� ������� �Ǿ�� �մϴ�.
        {   �� ����Ź������ ���, ��Ź���� ������ ����� �ʿ��մϴ�.
        { - ���ݰ�꼭 ���� �� ���޹޴��ڿ��� ���� ������ �߼۵˴ϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Issue
        {**********************************************************************}

        // �޸�
        memo := '����޸�';

        // ���޹޴��ڿ��� ���۵Ǵ� ����ȳ����� ����, �̱���� �⺻�������� ����
        emailSubject := '';

        // �������� ��������(forceIssue), �⺻��-false
        // ���ึ������ ���� ���ݰ�꼭�� �����ϴ� ���, ���꼼�� �ΰ��� �� �ֽ��ϴ�.
        // ���꼼�� �ΰ��Ǵ��� ������ �ؾ��ϴ� ��쿡�� forceIssue�� ����
        // true�� �����Ͽ� ����(Issue API)�� ȣ���Ͻø� �˴ϴ�.
        forceIssue := false;

        try
                response := taxinvoiceService.Issue(txtCorpNum.text, MgtKeyType,
                                tbMgtKey.Text, memo, emailSubject, forceIssue);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                 ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message + #10#13 +'����û���ι�ȣ : '+  response.ntsConfirmNum);
        end;

end;

procedure TfrmExample.btnCancelIssue_reverseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ����û ���� ���� "����Ϸ�" ������ ���ݰ�꼭�� "�������"�ϰ� ����û ���� ��󿡼� �����մϴ�.
        { - ����(Delete API) �Լ��� ȣ���Ͽ� "�������" ������ ���ڼ��ݰ�꼭�� �����ϸ�, ������ȣ ������ �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelIssue
        {**********************************************************************}

        // �޸�
        memo := '������� �޸�';

        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRefuseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { �����ڰ� ���޹޴��ڿ��� ������ ��û ���� ���ݰ�꼭�� ������ �ź��մϴ�.          
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Refuse
        {**********************************************************************}

        // �޸�
        memo := '(��)�����û �ź� �޸�';

        try
                response := taxinvoiceService.Refuse(txtCorpNum.text, MgtKeyType,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnCancelRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { �����ڰ� ��û���� ������ ���ݰ�꼭�� �����ϱ� ��, ���޹޴��ڰ� �������û�� ����մϴ�.
        { - �Լ� ȣ��� ���� ���� "���"�� ����ǰ�, �ش� ������ ���ݰ�꼭�� �����ڿ� ���� ���� �� �� �����ϴ�.
        { - [���]�� ���ݰ�꼭�� ������ȣ�� �����ϱ� ���ؼ��� ���� (Delete API) �Լ��� ȣ���ؾ� �մϴ�. 
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelRequest
        {**********************************************************************}

        // �޸�
        memo := '(��)�����û ��� �޸�';

        try
                response := taxinvoiceService.CancelRequest(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnDelete_reverseClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ���� ������ ������ ���ݰ�꼭�� �����մϴ�.
        { - ���� ������ ����: "�ӽ�����", "�������", "������ź�", "���������", "���۽���"
        { - ����ó���� ���ݰ�꼭�� ������ȣ�� ������ �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Delete
        {**********************************************************************}

        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺� ����Ʈ�� �α��� ���·� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#GetAccessURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnJoinMemberClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinForm;
begin
        {**********************************************************************}
        { ����ڸ� ����ȸ������ ����ó���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#JoinMember
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '4364364364';

        // ��ǥ�ڼ���, �ִ� 100��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 200��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 100��
        joinInfo.BizType := '����';

        // ����, �ִ� 100��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 50�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ, 6���̻� 20�� �̸�
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // ����ڸ�, �ִ� 100��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� ����, �ִ� 100��
        joinInfo.ContactEmail := 'code@linkhub.co.kr';

        try
                response := taxinvoiceService.JoinMember(joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { �ۼ��� ���ݰ�꼭 �����͸� �˺��� �����մϴ�.
        { - "�ӽ�����" ������ ���ݰ�꼭�� ����(Issue) �Լ��� ȣ���Ͽ� "����Ϸ�" ó���� ��쿡�� ����û���� ���۵˴ϴ�.
        { - ������ �� �ӽ�����(Register)�� ����(Issue)�� �ѹ��� ȣ��� ó���ϴ� ��ù���(RegistIssue API) ���μ��� ������ �����մϴ�.
        { - ������ �� �ӽ�����(Register)�� �������û(Request)�� �ѹ��� ȣ��� ó���ϴ� ��ÿ�û(RegistRequest API) ���μ��� ������ �����մϴ�.
        { - ���ݰ�꼭 ����÷�� ����� �����ϴ� ���, �ӽ�����(Register API) -> ����÷��(AttachFile API) -> ����(Issue API) �Լ��� ���ʷ� ȣ���մϴ�.
        { - ������ ���ݰ�꼭�� �����ϴ� ���, ��ü 'Taxinvoice'�� ���� 'chargeDirection' ���� ���� ���� ��ü�� ������ �� �ֽ��ϴ�.
        {   �� ������ : ������ ���� , ������ : ���޹޴��� ����
        { - �ӽ������ ���ݰ�꼭�� �˺� ����Ʈ '�ӽù�����'���� Ȯ�� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Register
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190113
        taxinvoice.writeDate := '20220101';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��, ����] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';

        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := txtCorpNum.text;

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ';

        // [�ʼ�] ������ ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [�ʼ�] ������ ��ǥ�� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        taxinvoice.invoicerAddr := '������ �ּ�';

        // ������ ����
        taxinvoice.invoicerBizClass := '������ ����';

        // ������ ����
        taxinvoice.invoicerBizType := '������ ����,����2';

        // ������ ����ڸ�
        taxinvoice.invoicerContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        taxinvoice.invoicerEmail := 'test@test.com';

        // ������ ����� ����ó
        taxinvoice.invoicerTEL := '070-4304-2991';

        // ������ ����� �޴��� ��ȣ
        taxinvoice.invoicerHP := '010-0000-2222';

        // ������� �˸����� ���ۿ��� (�����࿡���� ��밡��)
        // - ���޹޴��� ��)����� �޴�����ȣ(invoiceeHP1)�� ����
        // - ���۽� ����Ʈ�� �����Ǹ� ���۽����ϴ� ��� ����Ʈ ȯ��ó��
        taxinvoice.invoicerSMSSendYN := false;

        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // [�ʼ�] ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeType := '�����';

        // [�ʼ�] ���޹޴��� ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [�ʼ�] ���޹޴��� ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoiceeTaxRegID := '';

        // [�ʼ�] ���޹޴��� ��ȣ
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';

        // [������� �ʼ�] ���޹޴��� ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoiceeMgtKey := '';

        // [�ʼ�] ���޹޴��� ��ǥ�� ����
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';

        // ���޹޴��� �����ּ�
        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        {**********************************************************************}
        {                           ���ݰ�꼭 ����                            }
        {**********************************************************************}

        // [�ʼ�] ���ް��� �հ�
        taxinvoice.supplyCostTotal := '200000';

        // [�ʼ�] ���� �հ�
        taxinvoice.taxTotal := '20000';

        // [�ʼ�] �հ�ݾ�, (���ް��� �հ� + �����հ�)
        taxinvoice.totalAmount := '220000';

        // ���� �� '�Ϸù�ȣ' �׸�
        taxinvoice.serialNum := '';

        // ���� �� '��' �׸�, �ִ밪 32767
        // �̱���� taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
        // �̱���� taxinovice.ho := '';
        taxinvoice.ho := '1';

        // ���� �� '����' �׸�
        taxinvoice.cash := '';

        // ���� �� '��ǥ' �׸�
        taxinvoice.chkBill := '';

        // ���� �� '����' �׸�
        taxinvoice.note := '';

        // ���� �� '�ܻ�̼���' �׸�
        taxinvoice.credit := '';

        // ���� �� '���' �׸�
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';

        // ����ڵ���� �̹��� ÷�ο���
        taxinvoice.businessLicenseYN := false;

        // ����纻 �̹��� ÷�ο���
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         �������ݰ�꼭 ���� (�������ݰ�꼭 �ۼ��ÿ��� ����          }
        {   �������ݰ�꼭 ���� ������ �����Ŵ��� �Ǵ� ���߰��̵� ��ũ ����    }
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ���
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭 ����û���ι�ȣ ����
        taxinvoice.orgNTSConfirmNum := '';

        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ(serialNum) �� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';          //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[1].spec := '�԰�';                //�԰�
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';              //���

        {**********************************************************************}
        {                           �߰������ ����                            }
        { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
        { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
        {**********************************************************************}

        // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������

        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';     // ����ڸ�

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //�Ϸù�ȣ, 1���� ��������
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[1].contactName := '�߰�����ڸ�2';    // ����ڸ�

        try
                response := taxinvoiceService.Register(txtCorpNum.text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetBalance
        {**********************************************************************}

        try
                balance := taxinvoiceService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
        end;
end;

procedure TfrmExample.btnGetCertificateExpireDateClick(Sender: TObject);
var
        Expired : String;
begin
        {**********************************************************************}
        { �˺� ���������� ��ϵ� �������� �������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/cert#GetCertificateExpireDate
        {**********************************************************************}

        try
                Expired := taxinvoiceService.GetCertificateExpireDate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('������ ������ : '+ Expired);
        end;
end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {*******************************************************************}
        { ���ݰ�꼭 ����� ���ݵǴ� ����Ʈ �ܰ��� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetUnitCost
        {*******************************************************************}

        try
                unitcost := taxinvoiceService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('���ݰ�꼭 ����ܰ� : '+ FloatToStr(unitcost));
        end;
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin

        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetPartnerBalance
        {**********************************************************************}

        try
                balance := taxinvoiceService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));
        end;
end;

procedure TfrmExample.btnDelete_subClick(Sender: TObject);
var
        response : TResponse;
begin
        {***********************************************************************}
        { ���� ������ ������ ���ݰ�꼭�� �����մϴ�.
        { - ���� ������ ����: "�ӽ�����", "�������", "������ź�", "���������", "���۽���"
        { - ����ó���� ���ݰ�꼭�� ������ȣ�� ������ �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Delete
        {***********************************************************************}

        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        {**********************************************************************}
        { "�ӽ�����" ������ ���ݰ�꼭�� 1���� ������ ÷���մϴ�. (�ִ� 5��)
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#AttachFile
        {**********************************************************************}

        if OpenDialog1.Execute then begin
              filePath := OpenDialog1.FileName;
        end else begin
                Exit;
        end;

        try
                response := taxinvoiceService.AttachFile(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, filePath);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� ÷�ε� ���ϸ���� Ȯ���մϴ�.
        { - �����׸� �� ���Ͼ��̵�(AttachedFile) �׸��� ÷������ ����(DeleteFile API) �Լ� ȣ�� �� �̿��� �� �ֽ��ϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#GetFiles
        {**********************************************************************}
        
        try
                filelist := taxinvoiceService.GetFiles(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;


        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin        
                tmp := 'SerialNum(�Ϸù�ȣ) | DisplayName(���ϸ�) | AttachedFile(���Ͼ��̵�) | RegDT(����Ͻ�)' + #13;

                for i := 0 to Length(fileList) -1 do
                begin
                    tmp := tmp +  IntToStr(fileList[i].SerialNum) + ' | '
                                + fileList[i].DisplayName + ' | '
                                + fileList[i].AttachedFile + ' | '
                                + fileList[i].RegDT + #13;

                    tbFileIndexID.Text := fileList[i].AttachedFile;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { "�ӽ�����" ������ ���ݰ�꼭�� ÷�ε� 1���� ������ �����մϴ�.
        { - ���� �ĺ��� ���� ÷�� �� �ο��Ǵ� 'FileID'�� ÷������ ��� Ȯ��(GetFiles API) �Լ��� ȣ���Ͽ� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#DeleteFile
        {**********************************************************************}

        try
                response := taxinvoiceService.DeleteFile(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, tbFileIndexID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        taxinvoiceInfo : TTaxinvoiceInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ���ݰ�꼭 1���� ���� �� ��������� Ȯ���մϴ�.
        { ���ϰ� 'TTaxinvoiceInfo'�� ���� 'stateCode'�� ���� ���ݰ�꼭�� �����ڵ带 Ȯ���մϴ�.
        { ���ݰ�꼭 �����ڵ� [https://developers.popbill.com/reference/taxinvoice/delphi/response-code#state-code]                  
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetInfo
        {**********************************************************************}

        try
            taxinvoiceInfo := taxinvoiceService.getInfo(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := 'itemKey(�˺���ȣ) : ' +  taxinvoiceInfo.itemKey + #13;
                tmp := tmp + 'taxType (��������) : ' + taxinvoiceInfo.taxType + #13;
                tmp := tmp + 'writeDate (�ۼ�����) : ' + taxinvoiceInfo.writeDate + #13;
                tmp := tmp + 'regDT (�ӽ����� ����) : ' + taxinvoiceInfo.regDT + #13;
                tmp := tmp + 'issueDT (�����Ͻ�) : ' + taxinvoiceInfo.issueDT + #13;
                tmp := tmp + 'issueType (��������) : ' + taxinvoiceInfo.issueType + #13;
                tmp := tmp + 'supplyCostTotal (���ް��� �հ�) : ' + taxinvoiceInfo.supplyCostTotal + #13;
                tmp := tmp + 'taxTotal (���� �հ�) : ' + taxinvoiceInfo.taxTotal + #13;
                tmp := tmp + 'purposeType (����/û��) : ' + taxinvoiceInfo.purposeType + #13;
                tmp := tmp + 'lateIssueYN (�������� ����) : ' + BoolToStr(taxinvoiceInfo.lateIssueYN) + #13;
                tmp := tmp + 'openYN (���� ����) : ' + BoolToStr(taxinvoiceInfo.openYN) + #13;
                tmp := tmp + 'openDT (���� �Ͻ�) : ' + taxinvoiceInfo.openDT + #13;
                tmp := tmp + 'stateMemo (���¸޸�) : ' + taxinvoiceInfo.stateMemo + #13;
                tmp := tmp + 'stateCode (�����ڵ�) : ' + IntToStr(taxinvoiceInfo.stateCode) + #13;
                tmp := tmp + 'stateDT (���� �����Ͻ�) : ' + taxinvoiceInfo.stateDT + #13;
                tmp := tmp + 'ntsconfirmNum (����û���ι�ȣ) : ' + taxinvoiceInfo.ntsconfirmNum + #13;
                tmp := tmp + 'ntsresult (����û ���۰��) : ' + taxinvoiceInfo.ntsresult + #13;
                tmp := tmp + 'ntssendDT (����û �����Ͻ�) : ' + taxinvoiceInfo.ntssendDT + #13;
                tmp := tmp + 'ntsresultDT (����û ��� �����Ͻ�) : ' + taxinvoiceInfo.ntsresultDT + #13;
                tmp := tmp + 'ntssendErrCode (���л��� �����ڵ�) : ' + taxinvoiceInfo.ntssendErrCode + #13;
                tmp := tmp + 'modifyCode (���� �����ڵ�) : ' + taxinvoiceInfo.modifyCode + #13;
                tmp := tmp + 'interOPYN (�������� ����) : ' + BoolToStr(taxinvoiceInfo.interOPYN) + #13;
                tmp := tmp + 'invoicerCorpName (������ ��ȣ) : ' + taxinvoiceInfo.invoicerCorpName + #13;
                tmp := tmp + 'invoicerCorpNum (������ ����ڹ�ȣ) : ' + taxinvoiceInfo.invoicerCorpNum + #13;
                tmp := tmp + 'invoicerMgtKey (������ ������ȣ) : ' + taxinvoiceInfo.invoicerMgtKey + #13;
                tmp := tmp + 'invoicerPrintYN (������ �μ⿩��) : ' + BoolToStr(taxinvoiceInfo.invoicerPrintYN)+ #13;
                tmp := tmp + 'invoiceeCorpName (���޹޴��� ��ȣ) : ' + taxinvoiceInfo.invoiceeCorpName + #13;
                tmp := tmp + 'invoiceeCorpNum (���޹޴��� ����ڹ�ȣ) : ' + taxinvoiceInfo.invoiceeCorpNum + #13;
                tmp := tmp + 'invoiceeMgtKey(���޹޴��� ������ȣ) : ' + taxinvoiceInfo.invoiceeMgtKey + #13;
                tmp := tmp + 'invoiceePrintYN(���޹޴��� �μ⿩��) : ' + BoolToStr(taxinvoiceInfo.invoicerPrintYN)+ #13;
                tmp := tmp + 'closeDownState(���޹޴��� ���������) : ' + IntToStr(taxinvoiceInfo.closeDownState) + #13;
                tmp := tmp + 'closeDownStateDate(���޹޴��� ���������) : ' + taxinvoiceInfo.closeDownStateDate + #13;
                tmp := tmp + 'trusteeCorpName (��Ź�� ��ȣ) : ' + taxinvoiceInfo.trusteeCorpName + #13;
                tmp := tmp + 'trusteeCorpNum (��Ź�� ����ڹ�ȣ) : ' + taxinvoiceInfo.trusteeCorpNum + #13;
                tmp := tmp + 'trusteeMgtKey(��Ź�� ������ȣ) : ' + taxinvoiceInfo.trusteeMgtKey + #13;
                tmp := tmp + 'trusteePrintYN(��Ź�� �μ⿩��) : ' + BoolToStr(taxinvoiceInfo.trusteePrintYN);
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetInfosClick(Sender: TObject);
var
        KeyList : Array of String;
        InfoList : TTaxinvoiceInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { �ټ����� ���ݰ�꼭 ���� �� ��� ������ Ȯ���մϴ�. (1ȸ ȣ�� �� �ִ� 1,000�� Ȯ�� ����)
        { ���ϰ� 'TTaxinvoiceInfoList'�� ���� 'stateCode'�� ���� ���ݰ�꼭�� �����ڵ带 Ȯ���մϴ�.
        { ���ݰ�꼭 �����ڵ� [https://developers.popbill.com/reference/taxinvoice/delphi/response-code#state-code]      
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetInfos
        {**********************************************************************}

        // ���ݰ�꼭 ������ȣ �迭, �ִ� 1000�Ǳ��� ���簡��
        SetLength(KeyList,2);
        KeyList[0] := '20220101-001';
        KeyList[1] := '20220101-002';

        try
                InfoList := taxinvoiceService.getInfos(txtCorpNum.text, MgtKeyType, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
        
                tmp := tmp + 'itemKey(�˺���ȣ) |  taxType (��������) |  writeDate (�ۼ�����) |  regDT (�ӽ����� �Ͻ�) |  issueType (��������) |  supplyCostTotal (���ް��� �հ�) | ';
                tmp := tmp + 'taxTotal (���� �հ�) |  purposeType (����/û��) | issueDT (�����Ͻ�) | lateIssueYN (�������� ����) | openYN (���� ����) | openDT (���� �Ͻ�) | ';
                tmp := tmp + 'stateMemo (���¸޸�) | stateCode (�����ڵ�) | ntsconfirmNum (����û���ι�ȣ) | ntsresult (����û ���۰��) | ntssendDT (����û �����Ͻ�) | ';
                tmp := tmp + 'ntsresultDT (����û ��� �����Ͻ�) | ntssendErrCode (���л��� �����ڵ�) | modifyCode (���� �����ڵ�) | interOPYN (�������� ����) | invoicerCorpName (������ ��ȣ) |';
                tmp := tmp + 'invoicerCorpNum (������ ����ڹ�ȣ) | invoicerMgtKey (������ ������ȣ) | invoicerPrintYN (������ �μ⿩��) | invoiceeCorpName (���޹޴��� ��ȣ) |' ;
                tmp := tmp + 'invoiceeCorpNum (���޹޴��� ����ڹ�ȣ) | invoiceeMgtKey(���޹޴��� ������ȣ) | invoiceePrintYN(���޹޴��� �μ⿩��) | closeDownState(���޹޴��� ���������) |';
                tmp := tmp + 'closeDownStateDate(���޹޴��� ���������) | trusteeCorpName (��Ź�� ��ȣ) | trusteeCorpNum (��Ź�� ����ڹ�ȣ) | trusteeMgtKey(��Ź�� ������ȣ) | ';
                tmp := tmp + 'trusteePrintYN(��Ź�� �μ⿩��) ' + #13 + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].itemKey + '|'
                        + InfoList[i].taxType + '|'
                        + InfoList[i].writeDate + '|'
                        + InfoList[i].regDT + '|'
                        + InfoList[i].issueType + '|'
                        + InfoList[i].supplyCostTotal + '|'

                        + InfoList[i].taxTotal + '|'
                        + InfoList[i].purposeType + '|'
                        + BoolToStr(InfoList[i].lateIssueYN) + '|'
                        + BoolToStr(InfoList[i].openYN) + '|'
                        + InfoList[i].openDT + '|'
                        + InfoList[i].stateMemo + '|'
                        + IntToStr(InfoList[i].stateCode) + '|'
                        + InfoList[i].ntsconfirmNum + '|'
                        + InfoList[i].ntsresult + '|'
                        + InfoList[i].ntssendDT + '|'
                        + InfoList[i].ntsresultDT + '|'
                        + InfoList[i].ntssendErrCode + '|'
                        + InfoList[i].modifyCode + '|'
                        + BoolToStr(InfoList[i].interOPYN) + '|'

                        + InfoList[i].invoicerCorpName + '|'
                        + InfoList[i].invoicerCorpNum + '|'
                        + InfoList[i].invoicerMgtKey + '|'
                        + BoolToStr(InfoList[i].invoicerPrintYN)+ '|'

                        + InfoList[i].invoiceeCorpName + '|'
                        + InfoList[i].invoiceeCorpNum + '|'
                        + InfoList[i].invoiceeMgtKey + '|'
                        + BoolToStr(InfoList[i].invoicerPrintYN)+ '|'
                        + IntToStr(InfoList[i].closeDownState) + '|'
                        + InfoList[i].closeDownStateDate + '|'

                        + InfoList[i].trusteeCorpName + '|'
                        + InfoList[i].trusteeCorpNum + '|'
                        + InfoList[i].trusteeMgtKey + '|'
                        + BoolToStr(InfoList[i].trusteePrintYN) + #13 + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TTaxinvoiceLogList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� ���¿� ���� �����̷��� Ȯ���մϴ�.                            
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetLogs
        {**********************************************************************}

        try
                LogList := taxinvoiceService.getLogs(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := 'DocLogType(�α�Ÿ��) | Log(�̷�����) | ProcType(ó������) | procCorpName(ó��ȸ���) | ';
                tmp := tmp + 'procContactName(ó�������) | ProcMemo(ó���޸�) | RegDT(����Ͻ�) | IP(������)' + #13;

                for i := 0 to Length(LogList) -1 do
                begin
                    tmp := tmp + IntToStr(LogList[i].DocLogType) + ' | '
                                + LogList[i].Log + ' | '
                                + LogList[i].ProcType + ' | '
                                + LogList[i].ProcCorpName + ' | '
                                + LogList[i].ProcContactName + ' | '
                                + LogList[i].ProcMemo + ' | '
                                + LogList[i].RegDT + ' | '
                                + LogList[i].IP + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.cbMgtKeyTypeChange(Sender: TObject);
begin

        MgtKeyType := EnumMgtKeyType(GetEnumValue(TypeInfo(EnumMgtKeyType),cbMgtKeyType.Text));

end;

procedure TfrmExample.btnCancelIssue_subClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ����û ���� ���� "����Ϸ�" ������ ���ݰ�꼭�� "�������"�ϰ� ����û ���� ��󿡼� �����մϴ�.
        { - ����(Delete API) �Լ��� ȣ���Ͽ� "�������" ������ ���ڼ��ݰ�꼭�� �����ϸ�, ������ȣ ������ �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelIssue
        {**********************************************************************}

        // �޸�
        memo := '������� �޸�';
        
        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TIssueResponse;
        memo : String;
        emailSubject : String;
        forceIssue : Boolean;
begin
        {**********************************************************************}
        { "�ӽ�����" �Ǵ� "(��)������" ������ ���ݰ�꼭�� ����(���ڼ���)�ϸ�, "����Ϸ�" ���·� ó���մϴ�.
        { - ���ݰ�꼭 ����û ������å [https://developers.popbill.com/guide/taxinvoice/delphi/introduction/policy-of-send-to-nts]
        { - "����Ϸ�" �� ���ڼ��ݰ�꼭�� ����û ���� ������ �������(CancelIssue API) �Լ��� ����û �Ű� ��󿡼� ������ �� �ֽ��ϴ�.
        { - ���ݰ�꼭 ������ ���ؼ� �������� �������� �˺� ���������� ������� �Ǿ�� �մϴ�.
        {   �� ����Ź������ ���, ��Ź���� ������ ����� �ʿ��մϴ�.
        { - ���ݰ�꼭 ���� �� ���޹޴��ڿ��� ���� ������ �߼۵˴ϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Issue
        {**********************************************************************}

        // �޸�
        memo := '����޸�';

        // ���޹޴��ڿ��� ���۵Ǵ� ����ȳ����� ����, �̱���� �⺻�������� ����
        emailSubject := '';

        // �������� ��������(forceIssue), �⺻��-false
        // ���ึ������ ���� ���ݰ�꼭�� �����ϴ� ���, ���꼼�� �ΰ��� �� �ֽ��ϴ�.
        // ���꼼�� �ΰ��Ǵ��� ������ �ؾ��ϴ� ��쿡�� forceIssue�� ����
        // true�� �����Ͽ� ����(Issue API)�� ȣ���Ͻø� �˴ϴ�.
        forceIssue := false;

        try
                response := taxinvoiceService.Issue(txtCorpNum.text, MgtKeyType,
                                tbMgtKey.Text, memo, emailSubject, forceIssue);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message + #10#13 +'����û���ι�ȣ : '+  response.ntsConfirmNum);
        end;
end;

procedure TfrmExample.btnSendToNTSClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { "����Ϸ�" ������ ���ڼ��ݰ�꼭�� ����û�� ��� �����ϸ�, �Լ� ȣ�� �� �ִ� 30�� �̳��� ���� ó���� �Ϸ�˴ϴ�.
        { - ����û ��������� ȣ������ ���� ���ݰ�꼭�� ������ ���� ���� ������ ���� 3�ÿ� �˺� �ý��ۿ��� �ϰ������� ����û���� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#SendToNTS
        {**********************************************************************}

        try
                response := taxinvoiceService.SendToNTS(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {********************************************************************************}
        { ���޹޴��ڰ� ����� ������ ���ݰ�꼭�� �����ڿ��� �ۺ��Ͽ� ���� ��û�մϴ�.
        { - ������ ���ݰ�꼭 ���μ����� �����ϱ� ���ؼ��� ������/���޹޴��ڰ� ��� �˺��� ȸ���̿��� �մϴ�.
        { - ������ ��û�� ���ݰ�꼭�� "(��)������" �����̸�, �����ڰ� �˺� ����Ʈ �Ǵ� �Լ��� ȣ���Ͽ� ������ ��쿡�� ����û���� ���۵˴ϴ�.
        { - �����ڴ� �˺� ����Ʈ�� "���� ���� �����"���� ������ ������ ������ ���ݰ�꼭�� Ȯ���� �� �ֽ��ϴ�.
        { - ������ ��û�� �����ڿ��� ������ ��û ������ �߼۵˴ϴ�.
        { - �����ڰ� ������ ���ݰ�꼭 ����� ����Ʈ�� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Request
        {********************************************************************************}

        // �޸�
        memo := '(��)���� ��û �޸�';

        try
                response := taxinvoiceService.Request(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnCancelRequest_subClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {*******************************************************************}
        { �����ڰ� ��û���� ������ ���ݰ�꼭�� �����ϱ� ��, ���޹޴��ڰ� �������û�� ����մϴ�.
        { - �Լ� ȣ��� ���� ���� "���"�� ����ǰ�, �ش� ������ ���ݰ�꼭�� �����ڿ� ���� ���� �� �� �����ϴ�.
        { - [���]�� ���ݰ�꼭�� ������ȣ�� �����ϱ� ���ؼ��� ���� (Delete API) �Լ��� ȣ���ؾ� �մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelRequest
        {*******************************************************************}

        // �޸�
        memo := '(��)�����û ��� �޸�';

        try
                response := taxinvoiceService.CancelRequest(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRefuse_sub2Click(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { �����ڰ� ���޹޴��ڿ��� ������ ��û ���� ���ݰ�꼭�� ������ �ź��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Refuse
        {**********************************************************************}

        // �޸�
        memo := '(��)�����û �ź� �޸�';

        try
                response := taxinvoiceService.Refuse(txtCorpNum.text, MgtKeyType,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� ���õ� �ȳ� SMS(�ܹ�) ���ڸ� �������ϴ� �Լ���, �˺� ����Ʈ [���ڡ��ѽ�] > [����] > [���۳���] �޴����� ���۰���� Ȯ�� �� �� �ֽ��ϴ�.
        { - �޽����� �ִ� 90byte���� �Է� �����ϰ�, �ʰ��� ������ �ڵ����� �����Ǿ� �����մϴ�. (�ѱ� �ִ� 45��)
        { - �Լ� ȣ��� ����Ʈ�� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#SendSMS
        {**********************************************************************}

        // �߽Ź�ȣ, [����] �߽Ź�ȣ ��Ģ���� - http://blog.linkhub.co.kr/3064
        sendNum := '010-1111-2222';

        // ���Ź�ȣ
        receiveNum := '010-222-333';

        // �޽��� ����, �ִ� 90Byte(�ѱ� 45��)
        // ���̸� �ʰ��� ������ �����Ǿ� ���۵˴ϴ�.
        contents := '���ݰ�꼭�� ����Ǿ����ϴ� ������ Ȯ�����ּ���.';

        try
                response := taxinvoiceService.SendSMS(txtCorpNum.text, MgtKeyType,
                                        tbMgtKey.Text, sendNum, receiveNum, contents);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TfrmExample.btnSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� ���õ� �ȳ� ������ ������ �մϴ�.                                      
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#SendEmail
        {**********************************************************************}

        email := 'test@test.com';
        
        try
                response := taxinvoiceService.SendEmail(txtCorpNum.text, MgtKeyType,
                                                tbMgtKey.Text, email);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnSendFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� �ѽ��� �����ϴ� �Լ���, �˺� ����Ʈ [���ڡ��ѽ�] > [�ѽ�] > [���۳���] �޴����� ���۰���� Ȯ�� �� �� �ֽ��ϴ�.
        { - �Լ� ȣ��� ����Ʈ�� ���ݵ˴ϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#SendFAX
        {**********************************************************************}

        // �ѽ����� �߽Ź�ȣ
        sendNum := '070-111-222';

        // ������ �ѽ���ȣ
        receiveNum := '070-1234-1234';

        try
                response := taxinvoiceService.SendFAX(txtCorpNum.text, MgtKeyType,
                                         tbMgtKey.Text, sendNum, receiveNum);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnGetURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �α��� ���·� �˺� ����Ʈ�� ���ڼ��ݰ�꼭 �ӽ� ������ �޴��� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'TBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end

end;

procedure TfrmExample.btnGetURL2Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �α��� ���·� �˺� ����Ʈ�� ���ڼ��ݰ�꼭 ���� ������ �޴��� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'SBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end
end;

procedure TfrmExample.btnGetURL3Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �α��� ���·� �˺� ����Ʈ�� ���ڼ��ݰ�꼭 ���� ������ �޴��� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'PBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end        
end;

procedure TfrmExample.btnGetURL4Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �α��� ���·� �˺� ����Ʈ�� ���ڼ��ݰ�꼭 ���� �����ۼ� �޴��� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'WRITE');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end
end;

procedure TfrmExample.btnGetURL5Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �α��� ���·� �˺� ����Ʈ�� ���ڼ��ݰ�꼭 ���� ���� �����  �޴��� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'SWBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end

end;

procedure TfrmExample.btnGetURL6Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �α��� ���·� �˺� ����Ʈ�� ���ڼ��ݰ�꼭 ���� ���� ����� �޴��� ������ �� �ִ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, txtUserID.Text, 'PWBOX');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end

end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭 1���� �� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetPopUpURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPopupURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭 1���� �μ��ϱ� ���� �������� �˾� URL�� ��ȯ�ϸ�, ������������ �μ� �������� "������" / "���޹޴���" / "������+���޹޴���"�� �� �ϳ��� ������ �� �ֽ��ϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPrintURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetOldPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭 1���� ������ ������� �μ��ϱ� ���� �������� �˾� URL�� ��ȯ�ϸ�, ������������ �μ� �������� "������" / "���޹޴���" / "������+���޹޴���"�� �� �ϳ��� ������ �� �ֽ��ϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetOldPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getOldPrintURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ڼ��ݰ�꼭 �ȳ������� �󼼺��� ��ũ URL�� ��ȯ�մϴ�.
        { - �Լ� ȣ��� ��ȯ ���� URL���� ��ȿ�ð��� �����ϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetMailURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getMailURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin             
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetMassPrintURLClick(Sender: TObject);
var
        KeyList : Array of String;
        resultURL : String;
begin
        {**********************************************************************}
        { �ټ����� ���ݰ�꼭�� �μ��ϱ� ���� �������� �˾� URL�� ��ȯ�մϴ�. (�ִ� 100��)
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetMassPrintURL
        {**********************************************************************}

        // ���ݰ�꼭 ������ȣ �迭 (�ִ� 100��)
        SetLength(KeyList,4);
        KeyList[0] := '20220101-001';
        KeyList[1] := '20220101-002';
        KeyList[2] := '20220101-003';
        KeyList[3] := '20220101-004';

        try
                resultURL := taxinvoiceService.getMassPrintURL(txtCorpNum.text,
                        MgtKeyType, KeyList, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin        
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetEmailPublicKeyClick(Sender: TObject);
var
        EmailPublicKeyList : TEmailPublicKeyList;
        tmp : string;
        i  :Integer;
begin
        {*************************************************************}
        { ���ڼ��ݰ�꼭 ���������� ���� ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#GetEmailPublicKeys
        {*************************************************************}

        try
                EmailPublicKeyList := taxinvoiceService.GetEmailPublicKeys(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'confirmNum(�������� ���ι�ȣ) | email(�������� �̸���) ' + #13;


                for i := 0 to Length(EmailPublicKeyList) -1 do
                begin
                    tmp := tmp + EmailPublicKeyList[i].confirmNum + ' | '
                                + EmailPublicKeyList[i].email + #13;
                end;

                ShowMessage(tmp);
        end;


end;

procedure TfrmExample.btnRegister_reverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { �ۼ��� ���ݰ�꼭 �����͸� �˺��� �����մϴ�.
        { - "�ӽ�����" ������ ���ݰ�꼭�� ����(Issue) �Լ��� ȣ���Ͽ� "����Ϸ�" ó���� ��쿡�� ����û���� ���۵˴ϴ�.
        { - ������ �� �ӽ�����(Register)�� ����(Issue)�� �ѹ��� ȣ��� ó���ϴ� ��ù���(RegistIssue API) ���μ��� ������ �����մϴ�.
        { - ������ �� �ӽ�����(Register)�� �������û(Request)�� �ѹ��� ȣ��� ó���ϴ� ��ÿ�û(RegistRequest API) ���μ��� ������ �����մϴ�.
        { - ���ݰ�꼭 ����÷�� ����� �����ϴ� ���, �ӽ�����(Register API) -> ����÷��(AttachFile API) -> ����(Issue API) �Լ��� ���ʷ� ȣ���մϴ�.
        { - ������ ���ݰ�꼭�� �����ϴ� ���, ��ü 'Taxinvoice'�� ���� 'chargeDirection' ���� ���� ���� ��ü�� ������ �� �ֽ��ϴ�.
        {   �� ������ : ������ ���� , ������ : ���޹޴��� ����
        { - �ӽ������ ���ݰ�꼭�� �˺� ����Ʈ '�ӽù�����'���� Ȯ�� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Register
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20220101';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, �������� ��� ����� ���޹޴�����
        // ����Ʈ�� �����Ǵ� '������' ����
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��, ����] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';

        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := '8888888888';

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ';

        // [�ʼ�] ������ ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerMgtKey := '';

        // [�ʼ�] ������ ��ǥ�� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        taxinvoice.invoicerAddr := '������ �ּ�';

        // ������ ����
        taxinvoice.invoicerBizClass := '������ ����';

        // ������ ����
        taxinvoice.invoicerBizType := '������ ����,����2';

        // ������ ����ڸ�
        taxinvoice.invoicerContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        taxinvoice.invoicerEmail := 'test@test.com';

        // ������ ����� ����ó
        taxinvoice.invoicerTEL := '070-4304-2991';

        // ������ ����� �޴��� ��ȣ
        taxinvoice.invoicerHP := '010-0000-2222';

        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // [�ʼ�] ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeType := '�����';

        // [�ʼ�] ���޹޴��� ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoiceeCorpNum := txtCorpNum.text;

        // [�ʼ�] ���޹޴��� ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoiceeTaxRegID := '';

        // [�ʼ�] ���޹޴��� ��ȣ
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';

        // [������� �ʼ�] ���޹޴��� ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoiceeMgtKey := tbMgtKey.text;

        // [�ʼ�] ���޹޴��� ��ǥ�� ����
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';

        // ���޹޴��� �����ּ�
        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // ������ ��û�� �˸����� ���ۿ��� (�����࿡���� ��밡��)
        // - ������ ����� �޴�����ȣ(invoicerHP1)�� ����
        // - ���۽� ����Ʈ�� �����Ǹ� ���۽����ϴ� ��� ����Ʈ ȯ��ó��
        taxinvoice.invoiceeSMSSendYN := false;

        {**********************************************************************}
        {                           ���ݰ�꼭 ����                            }
        {**********************************************************************}

        // [�ʼ�] ���ް��� �հ�
        taxinvoice.supplyCostTotal := '200000';

        // [�ʼ�] ���� �հ�
        taxinvoice.taxTotal := '20000';

        // [�ʼ�] �հ�ݾ�, (���ް��� �հ� + �����հ�)
        taxinvoice.totalAmount := '220000';

        // ���� �� '�Ϸù�ȣ' �׸�
        taxinvoice.serialNum := '';

        // ���� �� '��' �׸�, �ִ밪 32767
        // �̱���� taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
        // �̱���� taxinovice.ho := '';
        taxinvoice.ho := '1';

        // ���� �� '����' �׸�
        taxinvoice.cash := '';

        // ���� �� '��ǥ' �׸�
        taxinvoice.chkBill := '';

        // ���� �� '����' �׸�
        taxinvoice.note := '';

        // ���� �� '�ܻ�̼���' �׸�
        taxinvoice.credit := '';

        // ���� �� '���' �׸�
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';

        // ����ڵ���� �̹��� ÷�ο���
        taxinvoice.businessLicenseYN := false;

        // ����纻 �̹��� ÷�ο���
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         �������ݰ�꼭 ���� (�������ݰ�꼭 �ۼ��ÿ��� ����          }
        {   �������ݰ�꼭 ���� ������ �����Ŵ��� �Ǵ� ���߰��̵� ��ũ ����    }
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ���
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭 ����û���ι�ȣ ����
        taxinvoice.orgNTSConfirmNum := '';

        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}
        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ (serialNum) �� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[1].spec := '�԰�';                //�԰�
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';              //���

        try
                response := taxinvoiceService.Register(txtCorpNum.text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { "�ӽ�����" ������ ���ݰ�꼭�� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Update
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20220101';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��, ����] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := txtCorpNum.text;

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ_����';

        // [�ʼ�] ������ ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [�ʼ�] ������ ��ǥ�� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����_����';

        // ������ �ּ�
        taxinvoice.invoicerAddr := '������ �ּ�_����';

        // ������ ����
        taxinvoice.invoicerBizClass := '������ ����_����';

        // ������ ����
        taxinvoice.invoicerBizType := '������ ����,����2_����';

        // ������ ����ڸ�
        taxinvoice.invoicerContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        taxinvoice.invoicerEmail := 'test@test.com';

        // ������ ����� ����ó
        taxinvoice.invoicerTEL := '070-4304-2991';

        // ������ ����� �޴��� ��ȣ
        taxinvoice.invoicerHP := '010-0000-2222';

        // ������� �˸����� ���ۿ��� (�����࿡���� ��밡��)
        // - ���޹޴��� ��)����� �޴�����ȣ(invoiceeHP1)�� ����
        // - ���۽� ����Ʈ�� �����Ǹ� ���۽����ϴ� ��� ����Ʈ ȯ��ó��
        taxinvoice.invoicerSMSSendYN := false;

        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // [�ʼ�] ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeType := '�����';

        // [�ʼ�] ���޹޴��� ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [�ʼ�] ���޹޴��� ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoiceeTaxRegID := '';

        // [�ʼ�] ���޹޴��� ��ȣ
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';

        // [������� �ʼ�] ���޹޴��� ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoiceeMgtKey := '';

        // [�ʼ�] ���޹޴��� ��ǥ�� ����
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';

        // ���޹޴��� �����ּ�
        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        {**********************************************************************}
        {                           ���ݰ�꼭 ����                            }
        {**********************************************************************}

        // [�ʼ�] ���ް��� �հ�
        taxinvoice.supplyCostTotal := '200000';

        // [�ʼ�] ���� �հ�
        taxinvoice.taxTotal := '20000';

        // [�ʼ�] �հ�ݾ�, (���ް��� �հ� + �����հ�)
        taxinvoice.totalAmount := '220000';

        // ���� �� '�Ϸù�ȣ' �׸�
        taxinvoice.serialNum := '';

        // ���� �� '��' �׸�, �ִ밪 32767
        // �̱���� taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
        // �̱���� taxinovice.ho := '';
        taxinvoice.ho := '1';

        // ���� �� '����' �׸�
        taxinvoice.cash := '';

        // ���� �� '��ǥ' �׸�
        taxinvoice.chkBill := '';

        // ���� �� '����' �׸�
        taxinvoice.note := '';

        // ���� �� '�ܻ�̼���' �׸�
        taxinvoice.credit := '';

        // ���� �� '���' �׸�
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';

        // ����ڵ���� �̹��� ÷�ο���
        taxinvoice.businessLicenseYN := false;

        // ����纻 �̹��� ÷�ο���
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         �������ݰ�꼭 ���� (�������ݰ�꼭 �ۼ��ÿ��� ����          }
        {   �������ݰ�꼭 ���� ������ �����Ŵ��� �Ǵ� ���߰��̵� ��ũ ����    }
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ���
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭 ����û���ι�ȣ ����
        taxinvoice.orgNTSConfirmNum := '';


        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ(serialNum) �� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[1].spec := '�԰�';                //�԰�
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';              //���


        {**********************************************************************}
        {                           �߰������ ����                            }
        { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
        { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
        {**********************************************************************}

        // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������
        
        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����        
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';     // ����ڸ�

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //�Ϸù�ȣ, 1���� ��������

        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����        
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[1].contactName := '�߰�����ڸ�2';    // ����ڸ�

        try
                response := taxinvoiceService.Update(txtCorpNum.text, MgtKeyType,
                                        tbMgtKey.Text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnUpdate_reverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { "�ӽ�����" ������ ���ݰ�꼭�� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Update
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20180114
        taxinvoice.writeDate := '20220101';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, �������� ��� ����� ���޹޴�����
        // ����Ʈ�� �����Ǵ� '������' ����
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��, ����] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := '8888888888';

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ_����';

        // [�ʼ�] ������ ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerMgtKey := '';

        // [�ʼ�] ������ ��ǥ�� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����_����';

        // ������ �ּ�
        taxinvoice.invoicerAddr := '������ �ּ�_����';

        // ������ ����
        taxinvoice.invoicerBizClass := '������ ����_����';

        // ������ ����
        taxinvoice.invoicerBizType := '������ ����,����2_����';

        // ������ ����ڸ�
        taxinvoice.invoicerContactName := '������ ����ڸ�_����';

        // ������ ����� �����ּ�
        taxinvoice.invoicerEmail := 'test@test.com';

        // ������ ����� ����ó
        taxinvoice.invoicerTEL := '070-4304-2991';

        // ������ ����� �޴��� ��ȣ
        taxinvoice.invoicerHP := '010-0000-2222';


        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // [�ʼ�] ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeType := '�����';

        // [�ʼ�] ���޹޴��� ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoiceeCorpNum := txtCorpNum.text;

        // [�ʼ�] ���޹޴��� ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoiceeTaxRegID := '';

        // [�ʼ�] ���޹޴��� ��ȣ
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';

        // [������� �ʼ�] ���޹޴��� ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoiceeMgtKey := tbMgtKey.text;

        // [�ʼ�] ���޹޴��� ��ǥ�� ����
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';

        // ���޹޴��� �����ּ�
        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // ������ ��û�� �˸����� ���ۿ��� (�����࿡���� ��밡��)
        // - ������ ����� �޴�����ȣ(invoicerHP1)�� ����
        // - ���۽� ����Ʈ�� �����Ǹ� ���۽����ϴ� ��� ����Ʈ ȯ��ó��
        taxinvoice.invoiceeSMSSendYN := false;


        {**********************************************************************}
        {                           ���ݰ�꼭 ����                            }
        {**********************************************************************}

        // [�ʼ�] ���ް��� �հ�
        taxinvoice.supplyCostTotal := '200000';

        // [�ʼ�] ���� �հ�
        taxinvoice.taxTotal := '20000';

        // [�ʼ�] �հ�ݾ�, (���ް��� �հ� + �����հ�)
        taxinvoice.totalAmount := '220000';

        // ���� �� '�Ϸù�ȣ' �׸�
        taxinvoice.serialNum := '';

        // ���� �� '��' �׸�, �ִ밪 32767
        // �̱���� taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
        // �̱���� taxinovice.ho := '';
        taxinvoice.ho := '1';

        // ���� �� '����' �׸�
        taxinvoice.cash := '';

        // ���� �� '��ǥ' �׸�
        taxinvoice.chkBill := '';

        // ���� �� '����' �׸�
        taxinvoice.note := '';

        // ���� �� '�ܻ�̼���' �׸�
        taxinvoice.credit := '';

        // ���� �� '���' �׸�
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';

        // ����ڵ���� �̹��� ÷�ο���
        taxinvoice.businessLicenseYN := false;

        // ����纻 �̹��� ÷�ο���
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         �������ݰ�꼭 ���� (�������ݰ�꼭 �ۼ��ÿ��� ����          }
        {   �������ݰ�꼭 ���� ������ �����Ŵ��� �Ǵ� ���߰��̵� ��ũ ����    }
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ���
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭 ����û���ι�ȣ ����
        taxinvoice.orgNTSConfirmNum := '';


        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}
        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ (serialNum) �� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[1].spec := '�԰�';                //�԰�
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';              //���

        try
                response := taxinvoiceService.Update(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, taxinvoice);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { ���ݰ�꼭 1���� �������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetDetailInfo
        {**********************************************************************}

        try
                taxinvoice := taxinvoiceService.getDetailInfo(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := tmp +'ntsconfirmNum(����û���ι�ȣ) : ' +  taxinvoice.nTSConfirmNum + #13;
                tmp := tmp +'issueType(��������) : ' +  taxinvoice.IssueType + #13;
                tmp := tmp +'taxType(��������) : ' +  taxinvoice.TaxType + #13;
                tmp := tmp +'chargeDirection(���ݹ���) : ' +  taxinvoice.ChargeDirection + #13;
                tmp := tmp +'serialNum(�Ϸù�ȣ) : ' +  taxinvoice.serialNum + #13;
                tmp := tmp +'kwon(��) : ' +  taxinvoice.kwon + #13;
                tmp := tmp +'ho(ȣ) : ' +  taxinvoice.ho + #13;
                tmp := tmp +'writeDate(�ۼ�����) : ' +  taxinvoice.WriteDate + #13;
                tmp := tmp +'purposeType(����/û��) : ' +  taxinvoice.purposeType + #13;
                tmp := tmp +'supplyCostTotal(���ް��� �հ�) : ' +  taxinvoice.supplyCostTotal + #13;
                tmp := tmp +'taxTotal(�����հ�) : ' +  taxinvoice.taxTotal + #13;
                tmp := tmp +'totalAmount(�հ�ݾ�) : ' +  taxinvoice.totalAmount + #13;
                tmp := tmp +'cash(����) : ' +  taxinvoice.cash + #13;
                tmp := tmp +'chkBill(��ǥ) : ' +  taxinvoice.chkBill + #13;
                tmp := tmp +'credit(�ܻ�) : ' +  taxinvoice.credit + #13;
                tmp := tmp +'note(����) : ' +  taxinvoice.note + #13;
                tmp := tmp +'remark1(���1) : ' +  taxinvoice.remark1 + #13;
                tmp := tmp +'remark2(���2) : ' +  taxinvoice.remark2 + #13;
                tmp := tmp +'remark3(���3) : ' +  taxinvoice.remark3 + #13;

                tmp := tmp + '-----���׸�-----' + #13;
                tmp := tmp + 'serialNum(�Ϸù�ȣ) | purchaseDT(�ŷ�����) | itemName(ǰ��) | spec(�԰�) | qty(����) |';
                tmp := tmp + 'unitCost(�ܰ�) | supplyCost(���ް���) | tax(����) | remark(���)' + #13;
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

                tmp := tmp + '-----������ ����-----' + #13;
                tmp := tmp +'invoicerCorpNum(����ڹ�ȣ) : ' +  taxinvoice.InvoicerCorpNum + #13;
                tmp := tmp +'invoicerMgtKey(������ ������ȣ) : ' +  taxinvoice.InvoicerMgtKey + #13;
                tmp := tmp +'invoicerTaxRegID(������� �ĺ���ȣ) : ' +  taxinvoice.InvoicerTaxRegID + #13;
                tmp := tmp +'invoicerCorpName(��ȣ) : ' +  taxinvoice.InvoicerCorpName + #13;
                tmp := tmp +'invoicerCEOName(��ǥ�� ����) : ' +  taxinvoice.InvoicerCEOName + #13;
                tmp := tmp +'invoicerAddr(�ּ�) : ' +  taxinvoice.InvoicerAddr + #13;
                tmp := tmp +'invoicerBizClass(����) : ' +  taxinvoice.InvoicerBizClass + #13;
                tmp := tmp +'invoicerBizType(����) : ' +  taxinvoice.InvoicerBizType + #13;
                tmp := tmp +'invoicerContactName(����� ����) : ' +  taxinvoice.InvoicerContactName + #13;
                tmp := tmp +'invoicerTEL(����� ����ó) : ' +  taxinvoice.InvoicerTEL + #13;
                tmp := tmp +'invoicerHP(����� �޴���) : ' +  taxinvoice.InvoicerHP + #13;
                tmp := tmp +'invoicerEmail(����� �̸���) : ' +  taxinvoice.InvoicerEmail + #13;
                tmp := tmp +'invoicerSMSSendYN(�������� ����) : ' +  IfThen(taxinvoice.InvoicerSMSSendYN,'true','false') + #13;

                tmp := tmp + '-----���޹޴��� ����-----' + #13;
                tmp := tmp +'invoiceeCorpNum(����ڹ�ȣ) : ' +  taxinvoice.InvoiceeCorpNum + #13;
                tmp := tmp +'invoiceeType(����) : ' +  taxinvoice.invoiceeType + #13;
                tmp := tmp +'invoiceeMgtKey(���޹޴��� ������ȣ) : ' +  taxinvoice.InvoiceeMgtKey + #13;
                tmp := tmp +'invoiceeTaxRegID(������� �ĺ���ȣ) : ' +  taxinvoice.InvoiceeTaxRegID + #13;
                tmp := tmp +'invoiceeCorpName(��ȣ) : ' +  taxinvoice.InvoiceeCorpName + #13;
                tmp := tmp +'invoiceeCEOName(��ǥ�� ����) : ' +  taxinvoice.InvoiceeCEOName + #13;
                tmp := tmp +'invoiceeAddr(�ּ�) : ' +  taxinvoice.InvoiceeAddr + #13;
                tmp := tmp +'invoiceeBizClass(����) : ' +  taxinvoice.InvoiceeBizClass + #13;
                tmp := tmp +'invoiceeBizType(����) : ' +  taxinvoice.InvoiceeBizType + #13;
                tmp := tmp +'closeDownState(���������) : ' +  IntToStr(taxinvoice.closeDownState) + #13;
                tmp := tmp +'closeDownStateDate(���������) : ' +  taxinvoice.closeDownStateDate + #13;
                tmp := tmp +'invoiceeContactName1(��)����� ����) : ' +  taxinvoice.InvoiceeContactName1 + #13;
                tmp := tmp +'invoiceeTEL1(��)����� ����ó) : ' +  taxinvoice.InvoiceeTEL1 + #13;
                tmp := tmp +'invoiceeHP1(��)����� �޴���) : ' +  taxinvoice.InvoiceeHP1 + #13;
                tmp := tmp +'invoiceeEmail1(��)����� �̸���) : ' +  taxinvoice.InvoiceeEmail1 + #13;
                tmp := tmp +'invoiceeSMSSendYN(�������� ����) : ' +  IfThen(taxinvoice.InvoiceeSMSSendYN,'true','false') + #13;

                tmp := tmp + '-----��Ź�� ����-----' + #13;
                tmp := tmp +'trusteeCorpNum(����ڹ�ȣ) : ' +  taxinvoice.trusteeCorpNum + #13;
                tmp := tmp +'trusteeMgtKey(��Ź�� ������ȣ) : ' +  taxinvoice.trusteeMgtKey + #13;
                tmp := tmp +'trusteeTaxRegID(������� �ĺ���ȣ) : ' +  taxinvoice.trusteeTaxRegID + #13;
                tmp := tmp +'trusteeCorpName(��ȣ) : ' +  taxinvoice.trusteeCorpName + #13;
                tmp := tmp +'trusteeCEOName(��ǥ�� ����) : ' +  taxinvoice.trusteeCEOName + #13;
                tmp := tmp +'trusteeAddr(�ּ�) : ' +  taxinvoice.trusteeAddr + #13;
                tmp := tmp +'trusteeBizClass(����) : ' +  taxinvoice.trusteeBizClass + #13;
                tmp := tmp +'trusteeBizType(����) : ' +  taxinvoice.trusteeBizType + #13;
                tmp := tmp +'trusteeContactName(����� ����) : ' +  taxinvoice.trusteeContactName + #13;
                tmp := tmp +'trusteeTEL(����� ����ó) : ' +  taxinvoice.trusteeTEL + #13;
                tmp := tmp +'trusteeHP(����� �޴���) : ' +  taxinvoice.trusteeHP + #13;
                tmp := tmp +'trusteeEmail(����� �̸���) : ' +  taxinvoice.trusteeEmail + #13;
                tmp := tmp +'trusteeSMSSendYN(�������� ����) : ' +  IfThen(taxinvoice.trusteeSMSSendYN,'true','false') + #13;

                tmp := tmp +'modifyCode(�������� �ڵ�) : ' +  taxinvoice.modifyCode + #13;
                tmp := tmp +'orgNTSConfirmNum(���� ���ݰ�꼭 ����û���ι�ȣ) : ' +  taxinvoice.orgNTSConfirmNum + #13;

                tmp := tmp + '-----�߰������-----' + #13;
                tmp := tmp + 'serialNum(�Ϸù�ȣ) | email(�̸���) | contactName(����� ����)' + #13;
        
                for i:= 0 to Length(taxinvoice.AddContactList)-1 do
                begin
                    tmp := tmp + IntToStr(taxinvoice.AddContactList[i].serialNum) + ' | ' +
                                 taxinvoice.AddContactList[i].email + ' | ' +
                                 taxinvoice.AddContactList[i].contactName + #13 ;
                end;

                tmp := tmp +'businessLicenseYN(����ڵ���� ÷��) : ' +  IfThen(taxinvoice.businessLicenseYN,'true','false') + #13;
                tmp := tmp +'bankBookYN(����纻 ÷��) : ' +  IfThen(taxinvoice.bankBookYN,'true','false') + #13;

                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnGetXMLClick(Sender: TObject);
var
        response : TTaxinvoiceXML;
        tmp : string;
begin
        {**********************************************************************}
        { ���ݰ�꼭 1���� �������� XML�� ��ȯ�մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#GetXML
        {**********************************************************************}

        try
                response := taxinvoiceService.getXML(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;


        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := 'code (�����ڵ�) : ' + IntToStr(response.code) + #13;
                tmp := tmp + 'message (����޽���) : ' + response.message + #13;
                tmp := tmp + 'retObject (���ڼ��ݰ�꼭 XML����) : ' + #13 + response.retObject;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        {***********************************************************************}
        { ��Ʈ�ʰ� ���ݰ�꼭 ���� �������� �Ҵ��ϴ� ������ȣ�� ��뿩�θ� Ȯ���մϴ�.
        { - �̹� ��� ���� ������ȣ�� �ߺ� ����� �Ұ��ϰ�, ���ݰ�꼭�� ������ ��쿡�� ������ȣ�� ������ �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#CheckMgtKeyInUse
        {***********************************************************************}

        try
                InUse := taxinvoiceService.CheckMgtKeyInUse(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(taxinvoiceService.LastErrCode) + #10#13 + '����޽��� : ' + taxinvoiceService.LastErrMessage);
        end
        else
        begin
                if InUse then ShowMessage('�����') else ShowMessage('�� �����.');
        end;

end;

procedure TfrmExample.btnGetEPrintUrlClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { "���޹޴���" �� ���ݰ�꼭 1���� �μ��ϱ� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetEPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getEPrintURL(txtCorpNum.Text,
                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin        
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnCheckIsMemberClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ����ڹ�ȣ�� ��ȸ�Ͽ� ����ȸ�� ���Կ��θ� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#CheckIsMember
        {**********************************************************************}

        try
                response := taxinvoiceService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {*******************************************************************************}
        { ����ϰ��� �ϴ� ���̵��� �ߺ����θ� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#CheckID
        {*******************************************************************************}

        try
                response := taxinvoiceService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := taxinvoiceService.GetCorpInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'CorpName (��ȣ): ' + corpInfo.CorpName + #13;
                tmp := tmp + 'CeoName (��ǥ�� ����) : ' + corpInfo.CeoName + #13;
                tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
                tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
                tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#UpdateCorpInfo
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 100��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 200��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 100��
        corpInfo.bizType := '����';

        // ����, �ִ� 100��
        corpInfo.bizClass := '����';

        // �ּ�, �ִ� 300��
        corpInfo.addr := '����Ư���� ������ ������� 517';

        try
                response := taxinvoiceService.UpdateCorpInfo(txtCorpNum.text, corpInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#ListContact
        {**********************************************************************}

        try
                InfoList := taxinvoiceService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin

                tmp := 'id(���̵�) | email(�̸���) | personName(����) | searchRole(����� ����) | ';
                tmp := tmp + 'tel(����ó) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';

                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';

                    tmp := tmp + BoolToStr(InfoList[i].mgrYN) + ' | ';
                    tmp := tmp + InfoList[i].regDT + ' | ';
                    tmp := tmp + IntToStr(InfoList[i].state) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnRegistContactClick(Sender: TObject);
var
        response : TResponse;
        joinInfo : TJoinContact;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� �����(�˺� �α��� ����)�� �߰��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := taxinvoiceService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ������ �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // ����� ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';

        try
                response := taxinvoiceService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRegistIssueClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TIssueResponse;
        writeSpecification : Boolean;
        forceIssue : Boolean;
        memo : String;
        emailSubject : String;
        dealInvoiceMgtKey : String;
begin

        {**********************************************************************}
        { �ۼ��� ���ݰ�꼭 �����͸� �˺��� ����� ���ÿ� ����(���ڼ���)�Ͽ� "����Ϸ�" ���·� ó���մϴ�.
        { - ���ݰ�꼭 ����û ���� ��å [https://developers.popbill.com/guide/taxinvoice/delphi/introduction/policy-of-send-to-nts]
        { - "����Ϸ�"�� ���ڼ��ݰ�꼭�� ����û ���� ������ �������(CancelIssue API) �Լ��� ����û �Ű� ��󿡼� ������ �� �ֽ��ϴ�.
        { - �ӽ�����(Register API) �Լ��� ����(Issue API) �Լ��� �� ���� ���μ����� ó���մϴ�.
        { - ���ݰ�꼭 ������ ���ؼ� �������� �������� �˺� ���������� ������� �Ǿ�� �մϴ�.
        {   �� ����Ź������ ���, ��Ź���� ������ ����� �ʿ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#RegistIssue
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20220602';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��, ����] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';

        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := txtCorpNum.text;

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ';

        // [�ʼ�] ������ ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerMgtKey := tbMgtKey.Text;

        // [�ʼ�] ������ ��ǥ�� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        taxinvoice.invoicerAddr := '������ �ּ�';

        // ������ ����
        taxinvoice.invoicerBizClass := '������ ����';

        // ������ ����
        taxinvoice.invoicerBizType := '������ ����,����2';

        // ������ ����ڸ�
        taxinvoice.invoicerContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        taxinvoice.invoicerEmail := 'test@test.com';

        // ������ ����� ����ó
        taxinvoice.invoicerTEL := '070-4304-2991';

        // ������ ����� �޴��� ��ȣ
        taxinvoice.invoicerHP := '010-0000-2222';

        // ������� �˸����� ���ۿ��� (�����࿡���� ��밡��)
        // - ���޹޴��� ��)����� �޴�����ȣ(invoiceeHP1)�� ����
        // - ���۽� ����Ʈ�� �����Ǹ� ���۽����ϴ� ��� ����Ʈ ȯ��ó��
        taxinvoice.invoicerSMSSendYN := false;

        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // [�ʼ�] ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeType := '�����';

        // [�ʼ�] ���޹޴��� ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoiceeCorpNum := '8888888888';

        // [�ʼ�] ���޹޴��� ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoiceeTaxRegID := '';

        // [�ʼ�] ���޹޴��� ��ȣ
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';

        // [������� �ʼ�] ���޹޴��� ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoiceeMgtKey := '';

        // [�ʼ�] ���޹޴��� ��ǥ�� ����
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';

        // ���޹޴��� �����ּ�
        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        {**********************************************************************}
        {                           ���ݰ�꼭 ����                            }
        {**********************************************************************}

        // [�ʼ�] ���ް��� �հ�
        taxinvoice.supplyCostTotal := '200000';

        // [�ʼ�] ���� �հ�
        taxinvoice.taxTotal := '20000';

        // [�ʼ�] �հ�ݾ�, (���ް��� �հ� + �����հ�)
        taxinvoice.totalAmount := '220000';

        // ���� �� '�Ϸù�ȣ' �׸�
        taxinvoice.serialNum := '';

        // ���� �� '��' �׸�, �ִ밪 32767
        // �̱���� taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
        // �̱���� taxinovice.ho := '';
        taxinvoice.ho := '1';

        // ���� �� '����' �׸�
        taxinvoice.cash := '';

        // ���� �� '��ǥ' �׸�
        taxinvoice.chkBill := '';

        // ���� �� '����' �׸�
        taxinvoice.note := '';

        // ���� �� '�ܻ�̼���' �׸�
        taxinvoice.credit := '';

        // ���� �� '���' �׸�
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';

        // ����ڵ���� �̹��� ÷�ο���
        taxinvoice.businessLicenseYN := false;

        // ����纻 �̹��� ÷�ο���
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         �������ݰ�꼭 ���� (�������ݰ�꼭 �ۼ��ÿ��� ����          }
        {   �������ݰ�꼭 ���� ������ �����Ŵ��� �Ǵ� ���߰��̵� ��ũ ����    }
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ���
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭 ����û���ι�ȣ ����
        taxinvoice.orgNTSConfirmNum := '';

        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ (serialNum) �� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[1].spec := '�԰�';                //�԰�
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';              //���

        {**********************************************************************}
        {                           �߰������ ����                            }
        { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
        { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
        {**********************************************************************}

        // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������
        
        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';     // ����ڸ�

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //�Ϸù�ȣ, 1���� ��������

        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����        
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[1].contactName := '�߰�����ڸ�2';    // ����ڸ�

        // �ŷ����� �����ۼ� ����
        writeSpecification := false;

        // �ŷ����� �����ۼ��� ���� ������ȣ, 1~24�ڸ� ����,����,'-','_' �������� ����
        dealInvoiceMgtKey := '';

        // �������� ��������(forceIssue)
        // ���ึ������ ���� ���ݰ�꼭�� �����ϴ� ���, ���꼼�� �ΰ��� �� �ֽ��ϴ�.
        // ���꼼�� �ΰ��Ǵ��� ������ �ؾ��ϴ� ��쿡�� forceIssue�� ����
        // true�� �����Ͽ� ����(Issue API)�� ȣ���Ͻø� �˴ϴ�.
        forceIssue := false;

        // �޸�
        memo := '��ù��� �޸�';

        // ���� �ȳ����� ����, �̱���� �⺻�������� ����
        emailSubject := '';

        try
                response := taxinvoiceService.RegistIssue(txtCorpNum.text, taxinvoice,
                                        writeSpecification, forceIssue, memo, emailSubject,
                                        dealInvoiceMgtKey);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message + #10#13 +'����û���ι�ȣ : '+  response.ntsConfirmNum);
        end;

end;

procedure TfrmExample.btnCancelIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ����û ���� ���� "����Ϸ�" ������ ���ݰ�꼭�� "�������"�ϰ� ����û ���� ��󿡼� �����մϴ�.
        { - ����(Delete API) �Լ��� ȣ���Ͽ� "�������" ������ ���ڼ��ݰ�꼭�� �����ϸ�, ������ȣ ������ �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#CancelIssue
        {**********************************************************************}

        // �޸�
        memo := '������� �޸�';

        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                 tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ���� ������ ������ ���ݰ�꼭�� �����մϴ�.
        { - ���� ������ ����: "�ӽ�����", "�������", "������ź�", "���������", "���۽���"
        { - ����ó���� ���ݰ�꼭�� ������ȣ�� ������ �����մϴ�.                     
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#Delete
        {**********************************************************************}
        
        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ������ ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetChargeURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetTaxCertURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {*********************************************************************}
        { ���ڼ��ݰ�꼭 ���࿡ �ʿ��� �������� �˺� ���������� ����ϱ� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/cert#GetTaxCertURL
        {*********************************************************************}

        try
                resultURL := taxinvoiceService.GetTaxCertURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetTaxCertInfoClick(Sender: TObject);
var
  certInfo : TTaxinvoiceCertificate;
  tmp      : String;
begin
        {*********************************************************************}
        { �˺� ���������� ��ϵ� ������������ ������ Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/cert#GetTaxCertInfo
        {*********************************************************************}

      try
                certInfo := taxinvoiceService.getTaxCertInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;


        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := tmp +'(����Ͻ�) : ' +  certInfo.regDT + #13;
                tmp := tmp +'(�����Ͻ�) : ' +  certInfo.expireDT + #13;
                tmp := tmp +'(������ �߱��� DN ) : ' +  certInfo.issuerDN + #13;
                tmp := tmp +'(��ϵ� ������ DN) : ' +  certInfo.subjectDN + #13;
                tmp := tmp +'(������ ����) : ' +  certInfo.issuerName + #13;
                tmp := tmp +'(OID) : ' +  certInfo.oid + #13;
                tmp := tmp +'(��� ����� ����) : ' +  certInfo.regContactName + #13;
                tmp := tmp +'(��� ����� ���̵�) : ' +  certInfo.regContactID + #13;


                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnSearchClick(Sender: TObject);
var
        DType : String;
        SDate : String;
        EDate : String;
        State : Array Of String;
        TType : Array Of String;
        TaxType : Array Of String;
        IssueType : Array Of String;
        RegType : Array Of String;
        CloseDownState : Array Of String;
        LateOnly : String;
        TaxRegIDYN : String;
        TaxRegIDType : String;
        TaxRegID : String;
        QString : String;
        MgtKey : String;
        Page : Integer;
        PerPage : Integer;
        Order : String;
        InterOPYN : String;
        tmp : String;
        SearchList : TSearchList;
        i : Integer;
begin
        {**********************************************************************}
        { �˻����ǿ� �ش��ϴ� ���ݰ�꼭�� ��ȸ�մϴ�. (��ȸ�Ⱓ ���� : �ִ� 6����)
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/info#Search
        {**********************************************************************}

        // [�ʼ�] �������� { R : ����Ͻ�, W : �ۼ�����, I : �����Ͻ� } �� ����
        DType := 'W';

        // [�ʼ�] ��������, �ۼ�����(yyyyMMdd)
        SDate := '20220101';

        // [�ʼ�] ��������, �ۼ�����(yyyyMMdd)
        EDate := '20220110';

        // ���ۻ��°� �迭. �̱���� ��ü ������ȸ, �������� �� 3�ڸ��� �迭, 2,3��°�ڸ� ���ϵ�ī�� ��밡��
        SetLength(State, 4);
        State[0] := '3**';
        State[1] := '4**';
        State[2] := '5**';
        State[3] := '6**';

        // �������� �迭. {N:�Ϲ�, M:����} ���ñ���, �̱���� ��ü��ȸ
        SetLength(TType,2);
        TType[0] := 'N';
        TType[1] := 'M';

        // ��������. {T:����, N:�鼼, Z:����} ���ñ���, �̱���� ��ü��ȸ
        SetLength(TaxType,3);
        TaxType[0] := 'T';
        TaxType[1] := 'N';
        TaxType[2] := 'Z';

        // �������� �迭, {N:������, R:������, T:����Ź) ���ñ���
        SetLength(IssueType, 3);
        IssueType[0] := 'N';
        IssueType[1] := 'R';
        IssueType[2] := 'T';

        // ������� �迭, {P:�˺� ���, H:Ȩ�ý�, �ܺ� ASP) ���ñ���
        SetLength(RegType, 2);
        RegType[0] := 'P';
        RegType[1] := 'H';

        // ���޹޴��� �������ȸ ���� �迭, N-��Ȯ��, 0-�̵��, 1-�����, 2-���, 3-�޾�
        SetLength(CloseDownState, 5);
        CloseDownState[0] := 'N';
        CloseDownState[1] := '0';
        CloseDownState[2] := '1';
        CloseDownState[3] := '2';
        CloseDownState[4] := '3';


        // �������࿩��. {���� : ��ü��ȸ, 0 : ���������ȸ, 1 : �������� ��ȸ} ���ñ���
        LateOnly := '';

        // ��������ȣ ����� ����, S-������, B-���޹޴���, T-��Ź��
        TaxRegIDType := 'S';

        // ������� ��ȣ, �޸�(,)�� �����Ͽ� ����, ex) 0001,0002
        TaxRegID := '';

        // ������� ����, {����-��ü��ȸ, 0-��������ȣ ���¹��� ��ȸ, 1-�˻����ǿ� ���� ��ȸ} ���ñ���
        TaxRegIDYN := '';

        // �ŷ�ó ����, �ŷ�ó ��ȣ �Ǵ� ����� ��Ϲ�ȣ ����, ���� ó���� ��ü��ȸ
        QString := '';

        // ���ڼ��ݰ�꼭 ������ȣ �Ǵ� ����û���ι�ȣ ����, ���� ó���� ��ü��ȸ
        MgtKey := '';

        // ��������ȣ, �⺻�� 1
        Page := 1;

        // �������� �˻�����, �⺻�� 500, �ִ� 1000
        PerPage := 10;

        // ���Ĺ���, 'D' : �������� , 'A' : ��������
        Order := 'D';

        // �������� ����, ����-��ü��ȸ, '0'-�Ϲݹ��� ��ȸ, '1'-�������� ��ȸ
        InterOPYN := '';

        try
                SearchList := taxinvoiceService.search(txtCorpNum.text, MgtKeyType, DType, SDate, EDate, State, TType,
                                        TaxType, IssueType, LateOnly, TaxRegIDType, TaxRegID, TaxRegIDYN, QString, Page, PerPage,
                                        Order, InterOPYN, txtUserID.text, RegType, CloseDownState, MgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'code (�����ڵ�) : '+IntToStr(SearchList.code) + #13;
                tmp := tmp + 'total (�� �˻���� �Ǽ�) : '+ IntToStr(SearchList.total) + #13;
                tmp := tmp + 'perPage (�������� �˻�����) : '+ IntToStr(SearchList.perPage) + #13;
                tmp := tmp + 'pageNum (������ ��ȣ) : '+ IntToStr(SearchList.pageNum) + #13;
                tmp := tmp + 'pageCount (������ ����) : '+ IntToStr(SearchList.pageCount) + #13;
                tmp := tmp + 'message (����޽���) : '+ SearchList.message + #13#13;

                tmp := tmp + 'itemKey(�˺���ȣ) |  taxType (��������) |  writeDate (�ۼ�����) |  regDT (�ӽ����� �Ͻ�) |  issueType (��������) |  supplyCostTotal (���ް��� �հ�) | ';
                tmp := tmp + 'taxTotal (���� �հ�) |  purposeType (����/û��) | issueDT (�����Ͻ�) | lateIssueYN (�������� ����) | openYN (���� ����) | openDT (���� �Ͻ�) | ';
                tmp := tmp + 'stateMemo (���¸޸�) | stateCode (�����ڵ�) | ntsconfirmNum (����û���ι�ȣ) | ntsresult (����û ���۰��) | ntssendDT (����û �����Ͻ�) | ';
                tmp := tmp + 'ntsresultDT (����û ��� �����Ͻ�) | ntssendErrCode (���л��� �����ڵ�) | modifyCode (���� �����ڵ�) | interOPYN (�������� ����) | invoicerCorpName (������ ��ȣ) |';
                tmp := tmp + 'invoicerCorpNum (������ ����ڹ�ȣ) | invoicerMgtKey (������ ������ȣ) | invoicerPrintYN (������ �μ⿩��) | invoiceeCorpName (���޹޴��� ��ȣ) |' ;
                tmp := tmp + 'invoiceeCorpNum (���޹޴��� ����ڹ�ȣ) | invoiceeMgtKey(���޹޴��� ������ȣ) | invoiceePrintYN(���޹޴��� �μ⿩��) | closeDownState(���޹޴��� ���������) |';
                tmp := tmp + 'closeDownStateDate(���޹޴��� ���������) | trusteeCorpName (��Ź�� ��ȣ) | trusteeCorpNum (��Ź�� ����ڹ�ȣ) | trusteeMgtKey(��Ź�� ������ȣ) | ';
                tmp := tmp + 'trusteePrintYN(��Ź�� �μ⿩��) ' + #13 + #13;

	        for i := 0 to Length(SearchList.list) -1 do
        	    begin
        	      tmp := tmp + SearchList.list[i].itemKey + '|'
                        + SearchList.list[i].taxType + '|'
                        + SearchList.list[i].writeDate + '|'
                       + SearchList.list[i].regDT + '|'
                        + SearchList.list[i].issueType + '|'
                        + SearchList.list[i].supplyCostTotal + '|'
                        + SearchList.list[i].taxTotal + '|'
                        + SearchList.list[i].purposeType + '|'
                        + BoolToStr(SearchList.list[i].lateIssueYN) + '|'
                        + BoolToStr(SearchList.list[i].openYN) + '|'
                        + SearchList.list[i].openDT + '|'
                        + SearchList.list[i].stateMemo + '|'
                        + IntToStr(SearchList.list[i].stateCode) + '|'
                        + SearchList.list[i].ntsconfirmNum + '|'
                        + SearchList.list[i].ntsresult + '|'
                        + SearchList.list[i].ntssendDT + '|'
                        + SearchList.list[i].ntsresultDT + '|'
                        + SearchList.list[i].ntssendErrCode + '|'
                        + SearchList.list[i].modifyCode + '|'
                        + BoolToStr(SearchList.list[i].interOPYN) + '|'
                        + SearchList.list[i].invoicerCorpName + '|'
                        + SearchList.list[i].invoicerCorpNum + '|'
                        + SearchList.list[i].invoicerMgtKey + '|'
                        + BoolToStr(SearchList.list[i].invoicerPrintYN)+ '|'
                        + SearchList.list[i].invoiceeCorpName + '|'
                        + SearchList.list[i].invoiceeCorpNum + '|'
                        + SearchList.list[i].invoiceeMgtKey + '|'
                        + BoolToStr(SearchList.list[i].invoicerPrintYN)+ '|'
                        + IntToStr(SearchList.list[i].closeDownState) + '|'
                        + SearchList.list[i].closeDownStateDate + '|'
                        + SearchList.list[i].trusteeCorpName + '|'
                        + SearchList.list[i].trusteeCorpNum + '|'
                        + SearchList.list[i].trusteeMgtKey + '|'
                        + BoolToStr(SearchList.list[i].trusteePrintYN)+ #13 + #13;
                        end;
                SearchList.Free;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnAttachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {****************************************************************}
        { �˺� ���ڸ��� API�� ���� ������ ���ڸ����� ���ݰ�꼭�� ÷���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#AttachStatement
        {****************************************************************}

        // ÷���� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û����, 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷���� ���ڸ��� ������ȣ
        SubMgtKey := '20220101-001';

        try
                response := taxinvoiceService.AttachStatement(txtCorpNum.text,
                                        MgtKeyType, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� ÷�ε� ���ڸ����� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#DetachStatement
        {**********************************************************************}

        // ÷�������� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û����, 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷�������� ���ڸ��� ������ȣ
        SubMgtKey := '20220101-001';

        try
                response := taxinvoiceService.DetachStatement(txtCorpNum.text,
                                        MgtKeyType, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnGetChargeInfoClick(Sender: TObject);
var
        chargeInfo : TTaxinvoiceChargeInfo;
        tmp : String;
begin
        {**********************************************************************}
        { �˺� ���ڼ��ݰ�꼭 API ���� ���������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetChargeInfo
        {**********************************************************************}

        try
                chargeInfo := taxinvoiceService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
                tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
                tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;
                ShowMessage(tmp);
        end;

end;

procedure TfrmExample.btnGetSealURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� ÷���� �ΰ�, ����ڵ����, ����纻�� ����ϴ� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#GetSealURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetSealURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetPartnerURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ��Ʈ�� ����Ʈ ������ ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetPartnerURL(txtCorpNum.Text, 'CHRG');
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnAssignMgtKeyClick(Sender: TObject);
var
        response : TResponse;
        mgtKey, itemKey : String;
        keyType : EnumMgtKeyType;
begin
        {**********************************************************************}
        { �˺� ����Ʈ�� ���� �����Ͽ� ������ȣ�� �ο����� ���� ���ݰ�꼭�� ������ȣ�� �Ҵ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#AssignMgtKey
        {**********************************************************************}

        // ���ݰ�꼭 ����, SELL-����, BUY-����, TRUSTEE-����Ź
        keyType := SELL;

        // ���ݰ�꼭 ������Ű, ���� �����ȸ(Search) API�� ��ȯ�׸��� ItemKey ����
        itemKey := '021011416122700001';

        // �Ҵ��� ������ȣ, ����, ���� '-', '_' �������� 1~24�ڸ�����
        // ����ڹ�ȣ�� �ߺ����� ������ȣ �Ҵ�
        mgtKey := '20220101-100';

        try
                response := taxinvoiceService.AssignMgtKey(txtCorpNum.text, keyType, itemKey, mgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;


procedure TfrmExample.btnCheckCertValidationClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �˺� ���������� ��ϵ� �������� ��ȿ���� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/cert#CheckCertValidation
        {**********************************************************************}

        try
                response := taxinvoiceService.CheckCertValidation(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnListEmailConfigClick(Sender: TObject);
var
        EmailConfigList : TEmailConfigList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        {  ���ݰ�꼭 ���� ���� �׸� ���� �߼ۼ����� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#ListEmailConfig
        {**********************************************************************}

        try
                EmailConfigList := taxinvoiceService.ListEmailConfig(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin        
                tmp := 'emailType(������������) | sendYN(���ۿ���)' + #13;

                for i := 0 to Length(EmailConfigList) -1 do
                begin
                    if EmailConfigList[i].EmailType = 'TAX_ISSUE' then
                        tmp := tmp + '[������] TAX_ISSUE (���޹޴��ڿ��� ���ڼ��ݰ�꼭 ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_ISSUE_INVOICER' then
                        tmp := tmp + '[������] TAX_ISSUE_INVOICER (�����ڿ��� ���ڼ��ݰ�꼭 ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CHECK' then
                        tmp := tmp + '[������] TAX_CHECK (�����ڿ��� ���ڼ��ݰ�꼭 ����Ȯ�� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CANCEL_ISSUE' then
                        tmp := tmp + '[������] TAX_CANCEL_ISSUE (���޹޴��ڿ��� ���ڼ��ݰ�꼭 ������� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_REQUEST' then
                        tmp := tmp + '[������] TAX_REQUEST (�����ڿ��� ���ݰ�꼭�� �����û ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CANCEL_REQUEST' then
                        tmp := tmp + '[������] TAX_CANCEL_REQUEST (���޹޴��ڿ��� ���ݰ�꼭 ��� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_REFUSE' then
                        tmp := tmp + '[������] TAX_REFUSE (���޹޴��ڿ��� ���ݰ�꼭 �ź� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_ISSUE' then
                        tmp := tmp + '[����Ź����] TAX_TRUST_ISSUE (���޹޴��ڿ��� ���ڼ��ݰ�꼭 ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_ISSUE_TRUSTEE' then
                        tmp := tmp + '[����Ź����] TAX_TRUST_ISSUE_TRUSTEE (��Ź�ڿ��� ���ڼ��ݰ�꼭 ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_ISSUE_INVOICER' then
                        tmp := tmp + '[����Ź����] TAX_TRUST_ISSUE_INVOICER (�����ڿ��� ���ڼ��ݰ�꼭 ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_CANCEL_ISSUE' then
                        tmp := tmp + '[����Ź����] TAX_TRUST_CANCEL_ISSUE (���޹޴��ڿ��� ���ڼ��ݰ�꼭 ������� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_CANCEL_ISSUE_INVOICER' then
                        tmp := tmp + '[����Ź����] TAX_TRUST_CANCEL_ISSUE_INVOICER (�����ڿ��� ���ڼ��ݰ�꼭 ������� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CLOSEDOWN' then
                        tmp := tmp + '[ó�����] TAX_CLOSEDOWN (�ŷ�ó�� ����� ���� Ȯ�� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_NTSFAIL_INVOICER' then
                        tmp := tmp + '[ó�����] TAX_NTSFAIL_INVOICER (���ڼ��ݰ�꼭 ����û ���۽��� �ȳ� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'ETC_CERT_EXPIRATION' then
                        tmp := tmp + '[����߼�] ETC_CERT_EXPIRATION (�˺����� �̿����� ������������ ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;
                end;
                ShowMessage(tmp);
        end;
end;

procedure TfrmExample.btnUpdateEmailConfigClick(Sender: TObject);
var
        response : TResponse;
        EmailType : String;
        SendYN    : Boolean;
begin
        {*********************************************************************************}
        {���ڼ��ݰ�꼭 �������� �׸� ���� ���ۿ��θ� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#UpdateEmailConfig
        {
        { ������������
        {  [������]
        {  TAX_ISSUE : ���޹޴��ڿ��� ���ڼ��ݰ�꼭 ���� ���� �˸�
        {  TAX_ISSUE_INVOICER : �����ڿ��� ���ڼ��ݰ�꼭 ���� ���� �˸�
        {  TAX_CHECK : �����ڿ��� ���ڼ��ݰ�꼭 ����Ȯ�� ���� �˸�
        {  TAX_CANCEL_ISSUE : ���޹޴��ڿ��� ���ڼ��ݰ�꼭 ������� ���� �˸�
        {
        {  [������]
        {  TAX_REQUEST : �����ڿ��� ���ݰ�꼭�� �����û ���� �˸�
        {  TAX_CANCEL_REQUEST : ���޹޴��ڿ��� ���ݰ�꼭 ��� ���� �˸�
        {  TAX_REFUSE : ���޹޴��ڿ��� ���ݰ�꼭 �ź� ���� �˸�
        {
        {  [����Ź����]
        {  TAX_TRUST_ISSUE : ���޹޴��ڿ��� ���ڼ��ݰ�꼭 ���� ���� �˸�
        {  TAX_TRUST_ISSUE_TRUSTEE : ��Ź�ڿ��� ���ڼ��ݰ�꼭 ���� ���� �˸�
        {  TAX_TRUST_ISSUE_INVOICER : �����ڿ��� ���ڼ��ݰ�꼭 ���� ���� �˸�
        {  TAX_TRUST_CANCEL_ISSUE : ���޹޴��ڿ��� ���ڼ��ݰ�꼭 ������� ���� �˸�
        {  TAX_TRUST_CANCEL_ISSUE_INVOICER : �����ڿ��� ���ڼ��ݰ�꼭 ������� ���� �˸�
        {
        {  [ó�����]
        {  TAX_CLOSEDOWN : �ŷ�ó�� ����� ���� Ȯ�� ���� �˸�
        {  TAX_NTSFAIL_INVOICER : ���ڼ��ݰ�꼭 ����û ���۽��� �ȳ� ���� �˸�
        {
        {  [����߼�]
        {  ETC_CERT_EXPIRATION : �˺����� �̿����� ������������ ���� ���� �˸�
        {*********************************************************************************}

        // ������������
        EmailType := 'TAX_ISSUE';

        // ���ۿ��� (True - ����, False - ������)
        SendYN := True;

        try
                response := taxinvoiceService.UpdateEmailConfig(txtCorpNum.text, EmailType, SendYN);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;
end;

procedure TfrmExample.btnRegistRequestClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ���޹޴��ڰ� �ۼ��� ���ݰ�꼭 �����͸� �˺��� �����ϰ� �����ڿ��� �ۺ��Ͽ� ������ ��û�մϴ�.
        { - ������ ���ݰ�꼭 ���μ����� �����ϱ� ���ؼ��� ������/���޹޴��ڰ� ��� �˺��� ȸ���̿��� �մϴ�.
        { - ���� ��û�� ���ݰ�꼭�� "(��)������" �����̸�, �����ڰ� �˺� ����Ʈ �Ǵ� �Լ��� ȣ���Ͽ� ������ ��쿡�� ����û���� ���۵˴ϴ�.
        { - �����ڴ� �˺� ����Ʈ�� "���� ���� �����"���� ������ ������ ������ ���ݰ�꼭�� Ȯ���� �� �ֽ��ϴ�.
        { - �ӽ�����(Register API) �Լ��� ������ ��û(Request API) �Լ��� �� ���� ���μ����� ó���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#RegistRequest
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20220101';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, �������� ��� ����� ���޹޴�����
        // ����Ʈ�� �����Ǵ� '������' ����
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��, ����] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';

        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := '8888888888';

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ';

        // ������ ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoicerMgtKey := '';

        // [�ʼ�] ������ ��ǥ�� ����
        taxinvoice.invoicerCEOName := '������ ��ǥ�� ����';

        // ������ �ּ�
        taxinvoice.invoicerAddr := '������ �ּ�';

        // ������ ����
        taxinvoice.invoicerBizClass := '������ ����';

        // ������ ����
        taxinvoice.invoicerBizType := '������ ����,����2';

        // ������ ����ڸ�
        taxinvoice.invoicerContactName := '������ ����ڸ�';

        // ������ ����� �����ּ�
        taxinvoice.invoicerEmail := 'test@test.com';

        // ������ ����� ����ó
        taxinvoice.invoicerTEL := '070-4304-2991';

        // ������ ����� �޴��� ��ȣ
        taxinvoice.invoicerHP := '010-0000-2222';

        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // [�ʼ�] ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeType := '�����';

        // [�ʼ�] ���޹޴��� ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoiceeCorpNum := txtCorpNum.text;

        // ���޹޴��� ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoiceeTaxRegID := '';

        // [�ʼ�] ���޹޴��� ��ȣ
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';

        // [������� �ʼ�] ���޹޴��� ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
        // ����� ���� �ߺ����� �ʵ��� ����
        taxinvoice.invoiceeMgtKey := tbMgtKey.Text;;

        // [�ʼ�] ���޹޴��� ��ǥ�� ����
        taxinvoice.invoiceeCEOName := '���޹޴��� ��ǥ�� ����';

        // ���޹޴��� �ּ�
        taxinvoice.invoiceeAddr := '���޹޴��� �ּ�';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizClass := '���޹޴��� ����';

        // ���޹޴��� ����
        taxinvoice.invoiceeBizType := '���޹޴��� ����';

        // ���޹޴��� ����ڸ�
        taxinvoice.invoiceeContactName1 := '���޹޴��� ����ڸ�';

        // ���޹޴��� �����ּ�
        // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
        // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����        
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // ������ ��û�� �˸����� ���ۿ��� (�����࿡���� ��밡��)
        // - ������ ����� �޴�����ȣ(invoicerHP1)�� ����
        // - ���۽� ����Ʈ�� �����Ǹ� ���۽����ϴ� ��� ����Ʈ ȯ��ó��
        taxinvoice.invoiceeSMSSendYN := false;

        {**********************************************************************}
        {                           ���ݰ�꼭 ����                            }
        {**********************************************************************}

        // [�ʼ�] ���ް��� �հ�
        taxinvoice.supplyCostTotal := '200000';

        // [�ʼ�] ���� �հ�
        taxinvoice.taxTotal := '20000';

        // [�ʼ�] �հ�ݾ�, (���ް��� �հ� + �����հ�)
        taxinvoice.totalAmount := '220000';

        // ���� �� '�Ϸù�ȣ' �׸�
        taxinvoice.serialNum := '';

        // ���� �� '��' �׸�, �ִ밪 32767
        // �̱���� taxinvoice.kwon := '';
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
        // �̱���� taxinovice.ho := '';
        taxinvoice.ho := '1';

        // ���� �� '����' �׸�
        taxinvoice.cash := '';

        // ���� �� '��ǥ' �׸�
        taxinvoice.chkBill := '';

        // ���� �� '����' �׸�
        taxinvoice.note := '';

        // ���� �� '�ܻ�̼���' �׸�
        taxinvoice.credit := '';

        // ���� �� '���' �׸�
        taxinvoice.remark1 := '���1';
        taxinvoice.remark2 := '���2';
        taxinvoice.remark3 := '���3';

        // ����ڵ���� �̹��� ÷�ο���
        taxinvoice.businessLicenseYN := false;

        // ����纻 �̹��� ÷�ο���
        taxinvoice.bankBookYN := false;

        {**********************************************************************}
        {         �������ݰ�꼭 ���� (�������ݰ�꼭 �ۼ��ÿ��� ����          }
        {   �������ݰ�꼭 ���� ������ �����Ŵ��� �Ǵ� ���߰��̵� ��ũ ����    }
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ���
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭 ����û���ι�ȣ ����
        taxinvoice.orgNTSConfirmNum := '';

        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ(serialNum) �� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20220101';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[1].spec := '�԰�';                //�԰�
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';              //���

        // �޸�
        memo := '��ÿ�û �޸�';

        try
                response := taxinvoiceService.RegistRequest(txtCorpNum.text, taxinvoice, memo);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
        end;

end;

procedure TfrmExample.btnGetViewURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭 1���� ������ ������(����Ʈ ���, ���� �޴� �� ��ư ����)�� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetViewURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getViewURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin             
                ShowMessage('URL :  ' + #13 + resultURL);
        end;
end;


procedure TfrmExample.btnGetPDFURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ڼ��ݰ�꼭 PDF ������ �ٿ� ���� �� �ִ� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/view#GetPDFURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPDFURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetSendToNTSConfigClick(Sender: TObject);
var
  result : Boolean;
begin
        {**********************************************************************}
        { ����ȸ���� ����û ���� �ɼ� ���� ���¸� Ȯ���մϴ�.
        { - �˺� ����û ���� ��å [https://developers.popbill.com/guide/taxinvoice/delphi/introduction/policy-of-send-to-nts]
        { - ����û ���� �ɼ� ������ �˺� ����Ʈ [���ڼ��ݰ�꼭] > [ȯ�漳��] > [���ݰ�꼭 ����] �޴����� ������ �� ������, API�� ������ �Ұ��� �մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/etc#GetSendToNTSConfig
        {**********************************************************************}
        
        try
                result := taxinvoiceService.GetSendToNTSConfig(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('���� ������� ���� : '+ BoolToStr(result));
        end;
end;

procedure TfrmExample.btnGetPaymentURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ �������� Ȯ���� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPaymentURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ��볻�� Ȯ���� ���� �������� �˾� URL�� ��ȯ�մϴ�.
        { - ��ȯ�Ǵ� URL�� ���� ��å�� 30�� ���� ��ȿ�ϸ�, �ð��� �ʰ��� �Ŀ��� �ش� URL�� ���� ������ ������ �Ұ��մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/point#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getUseHistoryURL(txtCorpNum.Text, txtUserID.Text);
                txtURL.Text := resultURL;
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
        end
        else
        begin
                ShowMessage('URL : ' + #13 + resultURL);
        end;

end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� �����(�˺� �α��� ����) ������ Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/member#GetContactInfo
        {**********************************************************************}

        contactID := 'testkorea';
        
        try
                contactInfo := taxinvoiceService.getContactInfo(txtCorpNum.Text, contactID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : ' + IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+ taxinvoiceService.LastErrMessage);
        end
        else
        begin
                tmp := 'id (���̵�) : ' + contactInfo.id + #13;
                tmp := tmp + 'personName (����� ����) : ' + contactInfo.personName + #13;
                tmp := tmp + 'tel (����� ����ó(��ȭ��ȣ)) : ' + contactInfo.tel + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

procedure TfrmExample.btnBulkSubmitClick(Sender: TObject);
var
        SubmitID : string;
        TaxinvoiceList : Array of TTaxinvoice;
        Taxinvoice : TTaxinvoice;
        i : integer;
        response : TBulkResponse;
begin
        {**********************************************************************}
        { �ִ� 100���� ���ݰ�꼭 ������ �ѹ��� ��û���� �����մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#BulkSubmit
        {**********************************************************************}
        SetLength(TaxinvoiceList, 10);

        for i :=0 to Length(TaxinvoiceList) -1 do
        begin
                // ���ݰ�꼭 ��ü ����
                TaxinvoiceList[i] := TTaxinvoice.Create;

                // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190113
                TaxinvoiceList[i].writeDate := '20220602';

                // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
                TaxinvoiceList[i].issueType := '������';

                // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
                // ������(������ ����), ������(���޹޴��� ����)
                TaxinvoiceList[i].chargeDirection := '������';

                // [�ʼ�] ����/û��, [����, û��] �� ����
                TaxinvoiceList[i].purposeType := '����';

                // [�ʼ�] ��������, [����, ����, �鼼] �� ����
                TaxinvoiceList[i].taxType :='����';

                {**********************************************************************}
                {                             ������ ����                              }
                {**********************************************************************}

                // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
                TaxinvoiceList[i].invoicerCorpNum := txtCorpNum.text;

                // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
                TaxinvoiceList[i].invoicerTaxRegID := '';

                // [�ʼ�] ������ ��ȣ
                TaxinvoiceList[i].invoicerCorpName := '������ ��ȣ';

                // [�ʼ�] ������ ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
                // ����� ���� �ߺ����� �ʵ��� ����
                TaxinvoiceList[i].invoicerMgtKey := txtSubmitID.Text + inttostr(i);

                // [�ʼ�] ������ ��ǥ�� ����
                TaxinvoiceList[i].invoicerCEOName := '��ǥ�ڼ���';

                // ������ �ּ�
                TaxinvoiceList[i].invoicerAddr := '�������ּ�';

                // ������ ����
                TaxinvoiceList[i].invoicerBizClass := '����������';

                // ������ ����
                TaxinvoiceList[i].invoicerBizType := '������ ����';

                // ������ ����ڸ�
                TaxinvoiceList[i].invoicerContactName := '������ ����ڸ�';

                // ������ ����� �����ּ�
                TaxinvoiceList[i].invoicerEmail := 'test@test.com';

                // ������ ����� ����ó
                TaxinvoiceList[i].invoicerTEL := '070-4304-2991';

                // ������ ����� �޴��� ��ȣ
                TaxinvoiceList[i].invoicerHP := '010-0000-2222';

                // ������� �˸����� ���ۿ��� (�����࿡���� ��밡��)
                // - ���޹޴��� ��)����� �޴�����ȣ(invoiceeHP1)�� ����
                // - ���۽� ����Ʈ�� �����Ǹ� ���۽����ϴ� ��� ����Ʈ ȯ��ó��
                TaxinvoiceList[i].invoicerSMSSendYN := false;

                {**********************************************************************}
                {                            ���޹޴��� ����                           }
                {**********************************************************************}

                // [�ʼ�] ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
                TaxinvoiceList[i].invoiceeType := '�����';

                // [�ʼ�] ���޹޴��� ����ڹ�ȣ, ������('-') ���� 10�ڸ�
                TaxinvoiceList[i].invoiceeCorpNum := '8888888888';

                // [�ʼ�] ���޹޴��� ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
                TaxinvoiceList[i].invoiceeTaxRegID := '';

                // [�ʼ�] ���޹޴��� ��ȣ
                TaxinvoiceList[i].invoiceeCorpName := '���޹޴��� ��ȣ';

                // [������� �ʼ�] ���޹޴��� ������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
                // ����� ���� �ߺ����� �ʵ��� ����
                TaxinvoiceList[i].invoiceeMgtKey := '';

                // [�ʼ�] ���޹޴��� ��ǥ�� ����
                TaxinvoiceList[i].invoiceeCEOName := '���޹޴��� ��ǥ�� ����';

                // ���޹޴��� �ּ�
                TaxinvoiceList[i].invoiceeAddr := '���޹޴��� �ּ�';

                // ���޹޴��� ����
                TaxinvoiceList[i].invoiceeBizClass := '���޹޴��� ����';

                // ���޹޴��� ����
                TaxinvoiceList[i].invoiceeBizType := '���޹޴��� ����';

                // ���޹޴��� ����ڸ�
                TaxinvoiceList[i].invoiceeContactName1 := '���޹޴��� ����ڸ�';

                // ���޹޴��� �����ּ�
                // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
                // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����
                TaxinvoiceList[i].invoiceeEmail1 := 'test@test.com';

                // ���޹޴��� ����ó
                TaxinvoiceList[i].invoiceeTEL1 := '070-4304-2991';

                // ���޹޴��� �޴�����ȣ
                TaxinvoiceList[i].invoiceeHP1 := '010-0000-222';

                {**********************************************************************}
                {                           ���ݰ�꼭 ����                            }
                {**********************************************************************}

                // [�ʼ�] ���ް��� �հ�
                TaxinvoiceList[i].supplyCostTotal := '200000';

                // [�ʼ�] ���� �հ�
                TaxinvoiceList[i].taxTotal := '20000';

                // [�ʼ�] �հ�ݾ�, (���ް��� �հ� + �����հ�)
                TaxinvoiceList[i].totalAmount := '220000';

                // ���� �� '�Ϸù�ȣ' �׸�
                TaxinvoiceList[i].serialNum := '';

                // ���� �� '��' �׸�, �ִ밪 32767
                // �̱���� taxinvoice.kwon := '';
                TaxinvoiceList[i].kwon := '1';

                // ���� �� 'ȣ' �׸�, �ִ밪 32767
                // �̱���� taxinovice.ho := '';
                TaxinvoiceList[i].ho := '1';

                // ���� �� '����' �׸�
                TaxinvoiceList[i].cash := '';

                // ���� �� '��ǥ' �׸�
                TaxinvoiceList[i].chkBill := '';

                // ���� �� '����' �׸�
                TaxinvoiceList[i].note := '';

                // ���� �� '�ܻ�̼���' �׸�
                TaxinvoiceList[i].credit := '';

                // ���� �� '���' �׸�
                TaxinvoiceList[i].remark1 := 'test';
                TaxinvoiceList[i].remark2 := 'tes';
                TaxinvoiceList[i].remark3 := 'test';

                // ����ڵ���� �̹��� ÷�ο���
                TaxinvoiceList[i].businessLicenseYN := false;

                // ����纻 �̹��� ÷�ο���
                TaxinvoiceList[i].bankBookYN := false;

                {**********************************************************************}
                {         �������ݰ�꼭 ���� (�������ݰ�꼭 �ۼ��ÿ��� ����          }
                {   �������ݰ�꼭 ���� ������ �����Ŵ��� �Ǵ� ���߰��̵� ��ũ ����    }
                { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://developers.popbill.com/guide/taxinvoice/delphi/introduction/modified-taxinvoice  }
                {**********************************************************************}

                // ���������ڵ�, ������������ 1~6�� ���ñ���
                TaxinvoiceList[i].modifyCode := '';

                // �������ݰ�꼭 ����û���ι�ȣ ����
                TaxinvoiceList[i].orgNTSConfirmNum := '';

                {**********************************************************************}
                {                        ���׸�(ǰ��) ����                           }
                {**********************************************************************}

                // ���׸� 0~99�� ���� �ۼ�����.
                // �Ϸù�ȣ(serialNum) �� 1���� 99���� ��������.
                // SetLength�� �ʱ�ȭ ���� ����.
                setLength(TaxinvoiceList[i].detailList, 2);

                TaxinvoiceList[i].detailList[0] := TTaxinvoiceDetail.Create;
                TaxinvoiceList[i].detailList[0].serialNum := 1;                //�Ϸù�ȣ
                TaxinvoiceList[i].detailList[0].purchaseDT := '20220602';      //�ŷ�����
                TaxinvoiceList[i].detailList[0].itemName := 'ǰ��1';          //ǰ���
                TaxinvoiceList[i].detailList[0].spec := '2';                //�԰�
                TaxinvoiceList[i].detailList[0].qty := '1';                    //����
                TaxinvoiceList[i].detailList[0].unitCost := '100000';          //�ܰ�
                TaxinvoiceList[i].detailList[0].supplyCost := '100000';        //���ް���
                TaxinvoiceList[i].detailList[0].tax := '10000';                //����
                TaxinvoiceList[i].detailList[0].remark := '���1';

                TaxinvoiceList[i].detailList[1] := TTaxinvoiceDetail.Create;
                TaxinvoiceList[i].detailList[1].serialNum := 2;                //�Ϸù�ȣ
                TaxinvoiceList[i].detailList[1].purchaseDT := '20220602';      //�ŷ�����
                TaxinvoiceList[i].detailList[1].itemName := 'ǰ��2';         //ǰ���
                TaxinvoiceList[i].detailList[1].spec := '3';                //�԰�
                TaxinvoiceList[i].detailList[1].qty := '1';                    //����
                TaxinvoiceList[i].detailList[1].unitCost := '100000';          //�ܰ�
                TaxinvoiceList[i].detailList[1].supplyCost := '100000';        //���ް���
                TaxinvoiceList[i].detailList[1].tax := '10000';                //����
                TaxinvoiceList[i].detailList[1].remark := '���2';              //���

                {**********************************************************************}
                {                           �߰������ ����                            }
                { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
                { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
                {**********************************************************************}

                // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
                SetLength(TaxinvoiceList[i].addContactList,2);

                TaxinvoiceList[i].addContactList[0] := TTaxinvoiceAddContact.Create;
                TaxinvoiceList[i].addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������

                // �˺� ����ȯ�濡�� �׽�Ʈ�ϴ� ��쿡�� �ȳ� ������ ���۵ǹǷ�,
                // ���� �ŷ�ó�� �����ּҰ� ������� �ʵ��� ����
                TaxinvoiceList[i].addContactList[0].email := 'test2@invoicee.com';     // �����ּ�
                TaxinvoiceList[i].addContactList[0].contactName := 'test';     // ����ڸ�

                TaxinvoiceList[i].addContactList[1] := TTaxinvoiceAddContact.Create;
                TaxinvoiceList[i].addContactList[1].serialNum := 2;    //�Ϸù�ȣ, 1���� ��������
                TaxinvoiceList[i].addContactList[1].email := 'test3@invoicee.com';     // �����ּ�
                TaxinvoiceList[i].addContactList[1].contactName := 'test';    // ����ڸ�
        end;
        
        try
                response := taxinvoiceService.BulkSubmit(txtCorpNum.Text, txtSubmitID.Text, TaxinvoiceList);

                ShowMessage('�����ڵ� : ' + IntToStr(response.code) + #10#13 +'����޽��� : '+ response.Message + #10#13 +'�������̵� : '+ response.receiptID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
end;


procedure TfrmExample.btnGetBulkResultClick(Sender: TObject);
var
        SubmitID : string;
        bulkTaxinvoiceResult : TBulkTaxinvoiceResult;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ������ ������ SubmitID�� ����Ͽ� ���ݰ�꼭 ��������� Ȯ���մϴ�.
        { - https://developers.popbill.com/reference/taxinvoice/delphi/api/issue#GetBulkResult
        {**********************************************************************}
        try
            bulkTaxinvoiceResult := taxinvoiceService.GetBulkResult(txtCorpNum.text, txtSubmitID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if taxinvoiceService.LastErrCode <> 0 then
        begin
                ShowMessage('�����ڵ� : '+ IntToStr(taxinvoiceService.LastErrCode) + #10#13 +'����޽��� : '+  taxinvoiceService.LastErrMessage);
                Exit;
        end
        else
        begin
                tmp := 'code(�ڵ�) : ' +  IntToStr(bulkTaxinvoiceResult.code) + #13;
                tmp := tmp + 'message (����޽���) : ' + bulkTaxinvoiceResult.message + #13;
                tmp := tmp + 'submitID (������̵�) : ' + bulkTaxinvoiceResult.submitID + #13;
                tmp := tmp + 'submitCount (���ݰ�꼭 ���� �Ǽ�) : ' + IntToStr(bulkTaxinvoiceResult.submitCount) + #13;
                tmp := tmp + 'successCount (���ݰ�꼭 ���� ���� �Ǽ�) : ' + IntToStr(bulkTaxinvoiceResult.successCount) + #13;
                tmp := tmp + 'failCount (���ݰ�꼭 ���� ���� �Ǽ�) : ' + IntToStr(bulkTaxinvoiceResult.failCount) + #13;
                tmp := tmp + 'txState (���������ڵ�) : ' + IntToStr(bulkTaxinvoiceResult.txState) + #13;
                tmp := tmp + 'txResultCode (���� ����ڵ�) : ' + IntToStr(bulkTaxinvoiceResult.txResultCode) + #13;
                tmp := tmp + 'txStartDT (����ó�� �����Ͻ�) : ' + bulkTaxinvoiceResult.txStartDT + #13;
                tmp := tmp + 'txEndDT (����ó�� �Ϸ��Ͻ�) : ' + bulkTaxinvoiceResult.txEndDT + #13;
                tmp := tmp + 'receiptDT (�����Ͻ�) : ' + bulkTaxinvoiceResult.receiptDT + #13;
                tmp := tmp + 'receiptID (�������̵�) : ' + bulkTaxinvoiceResult.receiptID + #13#13;

                tmp := tmp + 'invoicerMgtKey(������ ������ȣ) |  trusteeMgtKey (��Ź�� ������ȣ) |  code (�ڵ�) | message (�޽���) |ntsconfirmNum (����û���ι�ȣ) |  issueDT (�����Ͻ�)' + #13#13;
                for i := 0 to Length(bulkTaxinvoiceResult.issueResult) -1 do
                begin
        	  tmp := tmp + bulkTaxinvoiceResult.issueResult[i].invoicerMgtKey + ' | '
                        + bulkTaxinvoiceResult.issueResult[i].trusteeMgtKey + ' | '
                        + IntToStr(bulkTaxinvoiceResult.issueResult[i].code) + ' | '
                        + bulkTaxinvoiceResult.issueResult[i].message + ' | '
                        + bulkTaxinvoiceResult.issueResult[i].ntsconfirmNum + ' | '
                        + bulkTaxinvoiceResult.issueResult[i].issueDT + #13#13;
                end;
                bulkTaxinvoiceResult.Free;
                ShowMessage(tmp);
        end;
end;

end.
