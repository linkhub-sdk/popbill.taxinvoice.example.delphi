{******************************************************************************
{ �˺� ���ڼ��ݰ�꼭 API Delphi SDK Example
{
{ - SDK Ʃ�丮�� : https://docs.popbill.com/taxinvoice/tutorial/delphi
{ - ������Ʈ ���� : 2021-06-15
{ - ������� ����ó : 1600-9854 / 070-4304-2991
{ - ������� �̸��� : code@linkhub.co.kr
{
{ <�׽�Ʈ �������� �غ����>
{ (1) 36, 39�� ���ο� ����� ��ũ���̵�(LinkID)�� ���Ű(SecretKey)��
{    ��ũ��� ���Խ� ���Ϸ� �߱޹��� ���������� ����
{ (2) �˺� ���߿� ����Ʈ(test.popbill.com)�� ����ȸ������ ����
{ (3) ���ڼ��ݰ�꼭 ������ ���� ������������ ����մϴ�.
{    - �˺�����Ʈ �α��� > [���ڼ��ݰ�꼭] > [ȯ�漳��] > [���������� ����]
{    - ������������� �˾� URL (getTaxCertURL API)�� �̿��Ͽ� ���
{
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo, shellapi,
  Popbill, PopbillTaxinvoice, ExtCtrls;

const
        {**********************************************************************}
        { - ��������(��ũ���̵�, ���Ű)�� ��Ʈ���� ����ȸ���� �ĺ��ϴ�        }
        {   ������ ���ǹǷ� ������� �ʵ��� �����Ͻñ� �ٶ��ϴ�              }
        { - ����� ��ȯ���Ŀ��� ���������� ������� �ʽ��ϴ�.                  }
        {**********************************************************************}

        // ��ũ���̵�.
        LinkID = 'TESTER';

        // ��Ʈ�� ��ſ� ���Ű. ���� ����.
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
    Shape33: TShape;
    Shape5: TShape;
    btnGetViewURL: TButton;
    btnGetPDFURL: TButton;
    btnGetSendToNTSConfig: TButton;
    btnGetOldPrintURL: TButton;
    btnGetPaymentURL: TButton;
    btnGetUseHistoryURL: TButton;
    btnGetContactInfo: TButton;
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

        // ����ȯ�� ������, true(���߿�), false(�����)
        taxinvoiceService.IsTest := true;

        // Exception ó�� ������. �̱���� true(�⺻��)
        taxinvoiceService.IsThrowException := true;

        // ������ū IP���ѱ�� ��뿩��, true(����)
        taxinvoiceService.IPRestrictOnOff := true;

        //���ýý��� �ð� ��뿩��, true(���), false(�̻��) - �⺻��
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
        { [�ӽ�����] ������ ���ݰ�꼭�� [����]ó�� �մϴ�.                    
        { - ����(Issue API)�� ȣ���ϴ� �������� ����Ʈ�� �����˴ϴ�.
        { - [����Ϸ�] ���ݰ�꼭�� ����ȸ���� ����û ���ۼ����� ����
        {    ����/������� ó���˴ϴ�. �⺻����(��������)
        { - https://docs.popbill.com/taxinvoice/delphi/api#TIIssue
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message + #10#13 +'����û���ι�ȣ : '+  response.ntsConfirmNum);
end;

procedure TfrmExample.btnCancelIssue_reverseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { [����Ϸ�] ������ ���ݰ�꼭�� [�������] �մϴ�.
        { - [�������]�� �ش� ���ݰ�꼭�� ����û ���������� �����մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#CancelIssue
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

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnRefuseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { �����ڰ� ��û���� ������ ���ݰ�꼭�� [�ź�] ó���մϴ�.             
        { - https://docs.popbill.com/taxinvoice/delphi/api#Refuse
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnCancelRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ���޹޴��ڰ� ��û�� 1���� ������ ���ݰ�꼭�� [���] ó���մϴ�.     
        { - https://docs.popbill.com/taxinvoice/delphi/api#CancelRequest
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnDelete_reverseClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1���� ���ڼ��ݰ�꼭�� [����]�մϴ�. ���ݰ�꼭�� ������ ��쿡��
        { ������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#Delete
        {**********************************************************************}

        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnGetAccessURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.           
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetAccessURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getAccessURL(txtCorpNum.Text, txtUserID.Text);
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
        { ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.
        { - ���̵� �ߺ�Ȯ���� btnCheckIDClick ���ν����� �����Ͻñ� �ٶ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#JoinMember 
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

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� �ѽ���ȣ, �ִ� 20��
        joinInfo.ContactFAX := '02-6442-9700';

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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnRegisterClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { - ���ݰ�꼭 �ӽ�����(Register API) ȣ���Ŀ��� ����(Issue API)��     
        {   ȣ���ؾ߸� ����û���� ���۵˴ϴ�.
        { - �ӽ������ ������ �ѹ��� ȣ��� ó���ϴ� ��ù���(RegistIssue API)
        {   ���μ����� �����մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#Register
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190113
        taxinvoice.writeDate := '20210615';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://docs.popbill.com/taxinvoice/modify?lang=delphi  }
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
        taxinvoice.detailList[0].purchaseDT := '20210615';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';          //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20210615';      //�ŷ�����
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
                response := taxinvoiceService.Register(txtCorpNum.text, taxinvoice, txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnGetBalanceClick(Sender: TObject);
var
        balance : Double;
begin
        {**********************************************************************}
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ���������� �ƴ�
        { ��Ʈ�ʰ����� ��� ��Ʈ�� �ܿ�����Ʈ Ȯ��(GetPartnerBalance API)��
        { �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetBalance
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
        { �˺��� ��ϵǾ��ִ� ������������ �������ڸ� ��ȯ�մϴ�.
        { - ��ϵ� ������������ ����/��߱�/��й�ȣ���� �Ǵ� ��� ��������
        {   ���� �ϼž� ���������� API�� �̿��Ͻ� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetCertificateExpireDate
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
        { ���ڼ��ݰ�꼭 ����� �����Ǵ� ���� ����Ʈ �ܰ��� ��ȯ�մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetUnitCost
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
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ��Ʈ�ʰ����� �ƴ�
        { ���������� ��� ����ȸ�� �ܿ�����Ʈ Ȯ��(GetBalance API)��
        { �̿��Ͻñ� �ٶ��ϴ�
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetPartnerBalance
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
        { 1���� ���ڼ��ݰ�꼭�� [����]�մϴ�. ���ݰ�꼭�� ������ ��쿡��
        { ������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#Delete
        {***********************************************************************}

        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnAttachFileClick(Sender: TObject);
var
        filePath : string;
        response : TResponse;
begin
        {**********************************************************************}
        { ���ڼ��ݰ�꼭�� ÷�������� �߰��մϴ�.
        { - ���ݰ�꼭�� ÷������ ����� [�ӽ�����] ���¿����� �����մϴ�.
        {   [����Ϸ�]���¿����� ÷�������� ��� �� �� �����ϴ�.
        { - ÷�������� �ִ� 5������ �߰��� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#AttachFile                        
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;                                                 

procedure TfrmExample.btnGetFileListClick(Sender: TObject);
var
        fileList : TAttachedFileList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ���ڼ��ݰ�꼭�� ÷�ε� ������ ����� Ȯ���մϴ�.
        { - �����׸� �� ���Ͼ��̵�(AttachedFile)�� ���� ����(DeleteFile API)
        {   ȣ��� �̿��� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetFiles
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
        { ���ݰ�꼭�� ÷�ε� ������ �����մϴ�.                               
        { - ���Ͼ��̵�� ���ϸ�� (GetFiles API)�� �����׸��� ���Ͼ��̵�
        {   (AttachedFile) ���� Ȯ���Ͽ� DeleteFile API ȣ��� �����Ͻø� �˴ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#DeleteFile
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnGetInfoClick(Sender: TObject);
var
        taxinvoiceInfo : TTaxinvoiceInfo;
        tmp : string;
begin
        {**********************************************************************}
        { 1���� ���ݰ�꼭 ����/��� ������ Ȯ���մϴ�                         
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetInfo
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
        { �ٷ��� ���ݰ�꼭 ����/��� ������ Ȯ���մϴ�. (�ִ� 1000��)         
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetInfos
        {**********************************************************************}

        // ���ݰ�꼭 ������ȣ �迭, �ִ� 1000�Ǳ��� ���簡��
        SetLength(KeyList,2);
        KeyList[0] := '20210615-001';
        KeyList[1] := '20210615-002';

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
        { ���ݰ�꼭 ���� �����̷��� Ȯ���մϴ�                                
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetLogs
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
        { [����Ϸ�] ������ ���ݰ�꼭�� [�������] �մϴ�.                    
        { - [�������]�� �ش� ���ݰ�꼭�� ����û ���������� �����մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#CancelIssue
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnIssueClick(Sender: TObject);
var
        response : TIssueResponse;
        memo : String;
        emailSubject : String;
        forceIssue : Boolean;
begin
        {**********************************************************************}
        { [�ӽ�����] ������ ���ݰ�꼭�� [����]ó�� �մϴ�.                    
        { - ����(Issue API)�� ȣ���ϴ� �������� ����Ʈ�� �����˴ϴ�.
        { - [����Ϸ�] ���ݰ�꼭�� ����ȸ���� ����û ���ۼ����� ����
        {    ����/������� ó���˴ϴ�. �⺻������ ��������
        { - https://docs.popbill.com/taxinvoice/delphi/api#TIIssue
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message + #10#13 +'����û���ι�ȣ : '+  response.ntsConfirmNum);
end;

procedure TfrmExample.btnSendToNTSClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { [����Ϸ�] ������ ���ݰ�꼭�� ����û���� ������� �մϴ�.
        { - ����û ��������� ȣ������ ���� ��� [����Ϸ�] ������ ���ݰ�꼭��
        {   ������ �������� ���� ���� 3�ÿ� �ϰ������� ����û���� ���۵˴ϴ�.  
        { - https://docs.popbill.com/taxinvoice/delphi/api#SendToNTS
        {**********************************************************************}

        try
                response := taxinvoiceService.SendToNTS(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {********************************************************************************}
        { ���޹޴��ڰ� �����ڿ��� 1���� �ӽ����� ������ ���ݰ�꼭�� �����û�մϴ�.     
        { - ��)���� ���ݰ�꼭�� �����ϱ� ���ؼ��� ������/���޹޴��ڰ� ���
        {  �˺��� ȸ���̿��� �մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#Request
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnCancelRequest_subClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {*******************************************************************}
        { ���޹޴��ڰ� ��û�� ������ ���ݰ�꼭 ��û�� [���] ó���մϴ�.    
        { - [���]ó�� �� ���ݰ�꼭�� ������ȣ�� ���� �ϱ� ���ؼ���
        {   ���� (Delete API) ȣ���ؾ� �մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#CancelRequest
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnRefuse_sub2Click(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { �����ڰ� ��û���� ������ ���ݰ�꼭�� [�ź�] ó���մϴ�.
        { - [�ź�]ó�� �� ���ݰ�꼭�� ������ȣ�� ���� �ϱ� ���ؼ���
        {   ���� (Delete API) ȣ���ؾ� �մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#Refuse
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { �˸����ڸ� �����մϴ�. (�ܹ�/SMS- �ѱ� �ִ� 45��)
        { - �˸����� ���۽� ����Ʈ�� �����˴ϴ�. (���۽��н� ȯ��ó��)
        { - ���۳��� Ȯ���� "�˺� �α���" > [���� �ѽ�] > [����] > [���۳���]
        {   �޴����� ���۰���� Ȯ���� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#SendSMS
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
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { ���� �ȳ������� �������մϴ�.                                        
        { - https://docs.popbill.com/taxinvoice/delphi/api#SendEmail
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
        { ���ڼ��ݰ�꼭�� �ѽ������մϴ�.                                     
        { - �ѽ� ���� ��û�� ����Ʈ�� �����˴ϴ�. (���۽��н� ȯ��ó��)
        { - ���۳��� Ȯ���� "�˺� �α���" > [���� �ѽ�] > [�ѽ�] > [���۳���]
        {   �޴����� ���۰���� Ȯ���� �� �ֽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#SendFAX
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
        { �˺� > ���ڼ��ݰ�꼭 > �ӽ�(����)������ �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'TBOX');
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
        { �˺� > ���ڼ��ݰ�꼭 > ���� ������ �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'SBOX');
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
        { �˺� > ���ڼ��ݰ�꼭 > ���� ������ �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'PBOX');
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
        { �˺� > ���ڼ��ݰ�꼭 > ���� �����ۼ� �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'WRITE');
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
        { 1���� ���ڼ��ݰ�꼭 ���� �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetPopUpURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPopupURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
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
        { 1���� ���ڼ��ݰ�꼭 �μ��˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPrintURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
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
        { 1���� ���ڼ��ݰ�꼭 (��) ��� �μ��˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetOldPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getOldPrintURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
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
        { ���޹޴��� ���Ÿ��� ��ũ URL�� ��ȯ�մϴ�.                                
        { - ���ϸ�ũ URL�� ��ȿ�ð��� �������� �ʽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetMailURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getMailURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
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
        { �ټ����� ���ڼ��ݰ�꼭 �μ��˾� URL�� ��ȯ�մϴ�. (�ִ� 100��)
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetMassPrintURL
        {**********************************************************************}

        // ���ݰ�꼭 ������ȣ �迭 (�ִ� 100��)
        SetLength(KeyList,4);
        KeyList[0] := '20210615-001';
        KeyList[1] := '20210615-002';
        KeyList[2] := '20210615-003';
        KeyList[3] := '20210615-004';

        try
                resultURL := taxinvoiceService.getMassPrintURL(txtCorpNum.text,
                        MgtKeyType, KeyList);
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
        { �������� ���� ����� ��ȯ�մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetEmailPublicKeys
        {*************************************************************}

        try
                EmailPublicKeyList := taxinvoiceService.GetEmailPublicKeys(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

         tmp := 'confirmNum(�������� ���ι�ȣ) | email(�������� �̸���) ' + #13;
        
        for i := 0 to Length(EmailPublicKeyList) -1 do
        begin
            tmp := tmp + EmailPublicKeyList[i].confirmNum + ' | '
                        + EmailPublicKeyList[i].email + #13;
        end;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnRegister_reverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { 1���� ������ ���ݰ�꼭�� ���(�ӽ�����)�մϴ�.
        { - �������� ������, ���޹޴��� ��� �˺� ȸ���� ��쿡�� �����մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#Register
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20210615';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, �������� ��� ����� ���޹޴�����
        // ����Ʈ�� �����Ǵ� '������' ����
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://docs.popbill.com/taxinvoice/modify?lang=delphi  }
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
        taxinvoice.detailList[0].purchaseDT := '20210615';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20210615';      //�ŷ�����
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
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { [�ӽ�����] ������ ���ݰ�꼭�� �����׸��� �����մϴ�.                
        { - ����û�� ������ �Ϸ�� ���ݰ�꼭�� ���� �Ǵ� �����ϱ� ���ؼ���
        {    [�������ݰ�꼭]�� �����ؾ� �մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#Update
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20210615';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://docs.popbill.com/taxinvoice/modify?lang=delphi  }
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
        taxinvoice.detailList[0].purchaseDT := '20210615';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20210615';      //�ŷ�����
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
                                        tbMgtKey.Text, taxinvoice,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnUpdate_reverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { [�ӽ�����] ������ ��)���� ���ݰ�꼭�� �����׸��� �����մϴ�.        
        { - ���ݰ�꼭 ������ [�ӽ�����]���¿����� �����մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#Update
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20180114
        taxinvoice.writeDate := '20210615';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, �������� ��� ����� ���޹޴�����
        // ����Ʈ�� �����Ǵ� '������' ����
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://docs.popbill.com/taxinvoice/modify?lang=delphi  }
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
        taxinvoice.detailList[0].purchaseDT := '20210615';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20210615';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[1].spec := '�԰�';                //�԰�
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';              //���

        try
                response := taxinvoiceService.Update(txtCorpNum.text,MgtKeyType,tbMgtKey.Text, taxinvoice,txtUserID.Text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnGetDetailInfoClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        tmp : string;
        i : integer;
begin
        {**********************************************************************}
        { 1���� ���ݰ�꼭 ���׸��� Ȯ���մϴ�.                               
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetDetailInfo
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

procedure TfrmExample.btnCheckMgtKeyInUseClick(Sender: TObject);
var
        InUse : boolean;
begin
        {***********************************************************************}
        { ���ݰ�꼭�� �����ϱ��� ������ȣ �ߺ����θ� Ȯ���մϴ�.               
        { - ������ȣ�� 1~24�ڸ� ����, ����, '-', '_' �������� �����Ҽ� �ֽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#CheckMgtKeyInUse
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
        { ���ݰ�꼭 �μ�(���޹޴���) URL�� ��ȯ�մϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetEPrintURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getEPrintURL(txtCorpNum.Text,
                        MgtKeyType, tbMgtKey.Text);
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
        { ��Ʈ���� ����ȸ������ ���Ե� ����ڹ�ȣ���� Ȯ���մϴ�.              
        { - LinkID�� ���������� �����Ǿ� �ִ� ��ũ���̵� �Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#CheckIsMember
        {**********************************************************************}

        try
                response := taxinvoiceService.CheckIsMember(txtCorpNum.text, LinkID);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnCheckIDClick(Sender: TObject);
var
        response : TResponse;
begin
        {*******************************************************************************}
        { ����ȸ�� �ű԰���(JoinMember API)�� ȣ���ϱ� �� ���̵� �ߺ��� Ȯ���մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#CheckID
        {*******************************************************************************}

        try
                response := taxinvoiceService.CheckID(txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnGetCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetCorpInfo
        {**********************************************************************}

        try
                corpInfo := taxinvoiceService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
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
        { - https://docs.popbill.com/taxinvoice/delphi/api#UpdateCorpInfo
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
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ����� Ȯ���մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#ListContact
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

                tmp := 'id(���̵�) | email(�̸���) | hp(�޴���) | personName(����) | searchRole(����� ��ȸ ����) | ';
                tmp := tmp + 'tel(����ó) | fax(�ѽ�) | mgrYN(������ ����) | regDT(����Ͻ�) | state(����)' + #13;

                for i := 0 to Length(InfoList) -1 do
                begin
                    tmp := tmp + InfoList[i].id + ' | ';
                    tmp := tmp + InfoList[i].email + ' | ';
                    tmp := tmp + InfoList[i].hp + ' | ';
                    tmp := tmp + InfoList[i].personName + ' | ';
                    tmp := tmp + InfoList[i].searchRole + ' | ';
                    tmp := tmp + InfoList[i].tel + ' | ';
                    tmp := tmp + InfoList[i].fax + ' | ';
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
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#RegistContact
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 50�� �̸�)
        joinInfo.id := 'testkorea';

        // ��й�ȣ (8�� �̻� 20�� �̸�) ����, ���� ,Ư������ ����
        joinInfo.Password := 'asdf123!@';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 100�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó (�ִ� 20��)
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        joinInfo.hp := '010-1111-2222';

        // �ѽ���ȣ (�ִ� 20��)
        joinInfo.fax := '02-6442-9700';

        // [�ʼ�] �̸��� (�ִ� 100��)
        joinInfo.email := 'test@test.com';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        joinInfo.searchRole := '3';

        try
                response := taxinvoiceService.RegistContact(txtCorpNum.text, joinInfo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnUpdateContactClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ������ �����մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#UpdateContact
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';

        // ����ڸ� (�ִ� 100��)
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó (�ִ� 20��)
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ (�ִ� 20��)
        contactInfo.hp := '010-4324-1111';

        // �̸��� �ּ� (�ִ� 100��)
        contactInfo.email := 'test@test.com';

        // �ѽ���ȣ (�ִ� 20��)
        contactInfo.fax := '02-6442-9799';

        // ����� ��ȸ����, 1-���α��� / 2-�б���� / 3-ȸ�����
        contactInfo.searchRole := '3';

        try
                response := taxinvoiceService.UpdateContact(txtCorpNum.text, contactInfo, txtUserID.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
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
        { 1���� ���ݰ�꼭�� ��ù��� ó���մϴ�. (����)                       
        { - [����Ϸ�] ���ݰ�꼭�� ����ȸ���� ����û ���ۼ����� ����
        {   ��������/������� ó���˴ϴ�. �⺻����(��������)
        { - https://docs.popbill.com/taxinvoice/delphi/api#RegistIssue
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20210615';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://docs.popbill.com/taxinvoice/modify?lang=delphi  }
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
        taxinvoice.detailList[0].purchaseDT := '20210615';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20210615';      //�ŷ�����
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

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message + #10#13 +'����û���ι�ȣ : '+  response.ntsConfirmNum);
end;

procedure TfrmExample.btnCancelIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { [����Ϸ�] ������ ���ݰ�꼭�� ������� ó���մϴ�.                  
        { - [�������] ���ݰ�꼭�� ����û�� ���۵��� �ʽ��ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#CancelIssue
        {**********************************************************************}

        // �޸�
        memo := '������� �޸�';

        try
                response := taxinvoiceService.CancelIssue(txtCorpNum.text, MgtKeyType,
                                                 tbMgtKey.Text, memo, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1���� ���ڼ��ݰ�꼭�� [����]�մϴ�. ���ݰ�꼭�� ������ ��쿡��     
        { ������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.                         
        { - https://docs.popbill.com/taxinvoice/delphi/api#Delete
        {**********************************************************************}
        
        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnGetChargeURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetChargeURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetChargeURL(txtCorpNum.Text, txtUserID.Text);
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
        { �˺� ȸ���� ������������ ����ϴ� �˾� URL�� ��ȯ�մϴ�.          
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetTaxCertURL
        {*********************************************************************}

        try
                resultURL := taxinvoiceService.GetTaxCertURL(txtCorpNum.Text, txtUserID.Text);
                //ShellExecute(Handle, 'open', 'IEXPLORE.EXE', PChar(resultURL), '', SW_SHOWNORMAL);
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
        { �˻������� ����Ͽ� ���ݰ�꼭 ����� ��ȸ�մϴ�.                    
        { - https://docs.popbill.com/taxinvoice/delphi/api#Search
        {**********************************************************************}

        // [�ʼ�] �������� { R : ����Ͻ�, W : �ۼ�����, I : �����Ͻ� } �� ����
        DType := 'W';

        // [�ʼ�] ��������, �ۼ�����(yyyyMMdd)
        SDate := '20210601';

        // [�ʼ�] ��������, �ۼ�����(yyyyMMdd)
        EDate := '20210615';

        // ���ۻ��°� �迭. �̱���� ��ü ������ȸ, �������� �� 3�ڸ��� �迭, 2,3��°�ڸ� ���ϵ�ī�� ��밡��
        // [����] "[���ڼ��ݰ�꼭 API �����Ŵ���] > 5.1. (����)��꼭 �����ڵ�"
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

procedure TfrmExample.btnAttachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {****************************************************************}
        { ���ڼ��ݰ�꼭�� �˺��� ��ϵ� ���ڸ����� ÷���մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#AttachStatement
        {****************************************************************}

        // ÷���� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û����, 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷���� ���ڸ��� ������ȣ
        SubMgtKey := '20210615-001';

        try
                response := taxinvoiceService.AttachStatement(txtCorpNum.text,
                                        MgtKeyType, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnDetachStatementClick(Sender: TObject);
var
        response : TResponse;
        SubItemCode : Integer;
        SubMgtKey : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� ÷�ε� ���ڸ��� 1���� ÷�������մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#DetachStatement
        {**********************************************************************}

        // ÷�������� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û����, 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷�������� ���ڸ��� ������ȣ
        SubMgtKey := '20210615-001';

        try
                response := taxinvoiceService.DetachStatement(txtCorpNum.text,
                                        MgtKeyType, tbMgtKey.Text, SubItemCode, SubMgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
        {**********************************************************************}
        { ����ȸ���� ���ڼ��ݰ�꼭 API ���� ���������� Ȯ���մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetChargeInfo
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
        { �ΰ� �� ÷�ι��� ���  URL�� ��ȯ�մϴ�.
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetSealURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetSealURL(txtCorpNum.Text, txtUserID.Text);
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
        { ��Ʈ�� ����Ʈ���� �˾� URL�� ��ȯ�մϴ�.                          
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetPartnerURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetPartnerURL(txtCorpNum.Text, 'CHRG');
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
        { �˺�����Ʈ���� �ۼ��� ���ݰ�꼭�� ��Ʈ�� ������ȣ�� �Ҵ��մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#AssignMgtKey
        {**********************************************************************}

        // ���ݰ�꼭 ����, SELL-����, BUY-����, TRUSTEE-����Ź
        keyType := SELL;

        // ���ݰ�꼭 ������Ű, ���� �����ȸ(Search) API�� ��ȯ�׸��� ItemKey ����
        itemKey := '021011416122700001';

        // �Ҵ��� ������ȣ, ����, ���� '-', '_' �������� 1~24�ڸ�����
        // ����ڹ�ȣ�� �ߺ����� ������ȣ �Ҵ�
        mgtKey := '20210615-100';

        try
                response := taxinvoiceService.AssignMgtKey(txtCorpNum.text, keyType, itemKey, mgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;


procedure TfrmExample.btnCheckCertValidationClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �˺��� ��ϵ� ������������ ��ȿ���� Ȯ���մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#CheckCertValidation
        {**********************************************************************}

        try
                response := taxinvoiceService.CheckCertValidation(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnListEmailConfigClick(Sender: TObject);
var
        EmailConfigList : TEmailConfigList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        {  ���ڼ��ݰ�꼭 �������� �׸� ���� ���ۿ��θ� ������� ��ȯ�Ѵ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#ListEmailConfig
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

                    if EmailConfigList[i].EmailType = 'TAX_SEND' then
                        tmp := tmp + '[���࿹��] TAX_SEND (���޹޴��ڿ��� [���࿹��] ���ݰ�꼭 �߼� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_ACCEPT' then
                        tmp := tmp + '[���࿹��] TAX_ACCEPT (�����ڿ��� [���࿹��] ���ݰ�꼭 ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_ACCEPT_ISSUE' then
                        tmp := tmp + '[���࿹��] TAX_ACCEPT_ISSUE (�����ڿ��� [���࿹��] ���ݰ�꼭 �ڵ����� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_DENY' then
                        tmp := tmp + '[���࿹��] TAX_DENY (�����ڿ��� [���࿹��] ���ݰ�꼭 �ź� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CANCEL_SEND' then
                        tmp := tmp + '[���࿹��] TAX_CANCEL_SEND (���޹޴��ڿ��� [���࿹��] ���ݰ�꼭 ��� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

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

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_SEND' then
                        tmp := tmp + '[����Ź ���࿹��] TAX_TRUST_SEND (���޹޴��ڿ��� [���࿹��] ���ݰ�꼭 �߼� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_ACCEPT' then
                        tmp := tmp + '[����Ź ���࿹��] TAX_TRUST_ACCEPT (��Ź�ڿ��� [���࿹��] ���ݰ�꼭 ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_ACCEPT_ISSUE' then
                        tmp := tmp + '[����Ź ���࿹��] TAX_TRUST_ACCEPT_ISSUE (��Ź�ڿ��� [���࿹��] ���ݰ�꼭 �ڵ����� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_DENY' then
                        tmp := tmp + '[����Ź ���࿹��] TAX_TRUST_DENY (��Ź�ڿ��� [���࿹��] ���ݰ�꼭 �ź� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_TRUST_CANCEL_SEND' then
                        tmp := tmp + '[����Ź ���࿹��] TAX_TRUST_CANCEL_SEND (���޹޴��ڿ��� [���࿹��] ���ݰ�꼭 ��� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_CLOSEDOWN' then
                        tmp := tmp + '[ó�����] TAX_CLOSEDOWN (�ŷ�ó�� ����� ���� Ȯ�� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_NTSFAIL_INVOICER' then
                        tmp := tmp + '[ó�����] TAX_NTSFAIL_INVOICER (���ڼ��ݰ�꼭 ����û ���۽��� �ȳ� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

                    if EmailConfigList[i].EmailType = 'TAX_SEND_INFO' then
                        tmp := tmp + '[����߼�] TAX_SEND_INFO (���� �ͼӺ� [���� ���� ���] ���ݰ�꼭 ���� ����) | ' + BoolToStr(EmailConfigList[i].SendYN) + #13;

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
        { - https://docs.popbill.com/taxinvoice/delphi/api#UpdateEmailConfig
        {
        { ������������
        {  [������]
        {  TAX_ISSUE : ���޹޴��ڿ��� ���ڼ��ݰ�꼭 ���� ���� �˸�
        {  TAX_ISSUE_INVOICER : �����ڿ��� ���ڼ��ݰ�꼭 ���� ���� �˸�
        {  TAX_CHECK : �����ڿ��� ���ڼ��ݰ�꼭 ����Ȯ�� ���� �˸�
        {  TAX_CANCEL_ISSUE : ���޹޴��ڿ��� ���ڼ��ݰ�꼭 ������� ���� �˸�
        {
        {  [���࿹��]
        {  TAX_SEND : ���޹޴��ڿ��� [���࿹��] ���ݰ�꼭 �߼� ���� �˸�
        {  TAX_ACCEPT : �����ڿ��� [���࿹��] ���ݰ�꼭 ���� ���� �˸�
        {  TAX_ACCEPT_ISSUE : �����ڿ��� [���࿹��] ���ݰ�꼭 �ڵ����� ���� �˸�
        {  TAX_DENY : �����ڿ��� [���࿹��] ���ݰ�꼭 �ź� ���� �˸�
        {  TAX_CANCEL_SEND : ���޹޴��ڿ��� [���࿹��] ���ݰ�꼭 ��� ���� �˸�
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
        {  [����Ź ���࿹��]
        {  TAX_TRUST_SEND : ���޹޴��ڿ��� [���࿹��] ���ݰ�꼭 �߼� ���� �˸�
        {  TAX_TRUST_ACCEPT : ��Ź�ڿ��� [���࿹��] ���ݰ�꼭 ���� ���� �˸�
        {  TAX_TRUST_ACCEPT_ISSUE : ��Ź�ڿ��� [���࿹��] ���ݰ�꼭 �ڵ����� ���� �˸�
        {  TAX_TRUST_DENY : ��Ź�ڿ��� [���࿹��] ���ݰ�꼭 �ź� ���� �˸�
        {  TAX_TRUST_CANCEL_SEND : ���޹޴��ڿ��� [���࿹��] ���ݰ�꼭 ��� ���� �˸�
        {
        {  [ó�����]
        {  TAX_CLOSEDOWN : �ŷ�ó�� ����� ���� Ȯ�� ���� �˸�
        {  TAX_NTSFAIL_INVOICER : ���ڼ��ݰ�꼭 ����û ���۽��� �ȳ� ���� �˸�
        {
        {  [����߼�]
        {  TAX_SEND_INFO : ���� �ͼӺ� [���� ���� ���] ���ݰ�꼭 ���� ���� �˸�
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
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnRegistRequestClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        {[���޹޴���]�� �����ڿ��� 1���� ������ ���ݰ�꼭�� [��� ��û]�մϴ�.
        { - ������ ���ݰ�꼭 ���μ����� �����ϱ� ���ؼ��� ������/���޹޴��ڰ�
        {   ��� �˺��� ȸ���̿��� �մϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#RegistRequest        
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20190114
        taxinvoice.writeDate := '20210615';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, �������� ��� ����� ���޹޴�����
        // ����Ʈ�� �����Ǵ� '������' ����
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - https://docs.popbill.com/taxinvoice/modify?lang=delphi  }
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
        taxinvoice.detailList[0].purchaseDT := '20210615';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���1';         //ǰ���
        taxinvoice.detailList[0].spec := '�԰�';                //�԰�
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';              //���

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20210615';      //�ŷ�����
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
                response := taxinvoiceService.RegistRequest(txtCorpNum.text, taxinvoice, memo, txtUserID.text);
                taxinvoice.Free;
        except
                on le : EPopbillException do begin
                        taxinvoice.Free;
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnGetViewURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 1���� ���ڼ��ݰ�꼭 ���� �˾� URL�� ��ȯ�մϴ�. (�޴�/��ư ����)    
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetViewURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getViewURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
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
        { 1���� ���ڼ��ݰ�꼭 PDF �ٿ�ε� �˾� URL�� ��ȯ�մϴ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetPDFURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPDFURL(txtCorpNum.Text,
                                        MgtKeyType, tbMgtKey.Text);
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
        { ����û ���� ������ Ȯ���մϴ�.
        { - true : ���� ��� ����, false : ���� �ڵ� ���� 
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetSendToNTSConfig
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
        { ����ȸ�� ����Ʈ �������� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetPaymentURL
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPaymentURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetUseHistoryURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { ����ȸ�� ����Ʈ ��볻�� �˾� URL�� ��ȯ�Ѵ�.
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���̴�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetUseHistoryURL
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getUseHistoryURL(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : ' + IntToStr(le.code) + #10#13 +'����޽��� : '+ le.Message);
                        Exit;
                end;
        end;
        ShowMessage('URL :  ' + #13 + resultURL);

end;

procedure TfrmExample.btnGetContactInfoClick(Sender: TObject);
var
        contactInfo : TContactInfo;
        contactID : string;
        tmp : string;
begin
        {**********************************************************************}
        { ����ȸ�� ����ڹ�ȣ�� ��ϵ� ����� ������ Ȯ���Ѵ�.
        { - https://docs.popbill.com/taxinvoice/delphi/api#GetContactInfo
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
                tmp := tmp + 'hp (����� �޴�����ȣ) : ' + contactInfo.hp + #13;
                tmp := tmp + 'fax (����� �ѽ���ȣ) : ' + contactInfo.fax + #13;
                tmp := tmp + 'email (����� �̸���) : ' + contactInfo.email + #13;
                tmp := tmp + 'regDT (��� �Ͻ�) : ' + contactInfo.regDT + #13;
                tmp := tmp + 'searchRole (����� ��ȸ����) : ' + contactInfo.searchRole + #13;
                tmp := tmp + 'mgrYN (������ ����) : ' + booltostr(contactInfo.mgrYN) + #13;
                tmp := tmp + 'state (��������) : ' + inttostr(contactInfo.state) + #13;
                ShowMessage(tmp);
        end
end;

end.
