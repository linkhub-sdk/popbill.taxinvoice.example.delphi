{******************************************************************************}
{ �˺� ���ڼ��ݰ�꼭 API Delphi SDK Example                                   }
{                                                                              }
{ - ������ SDK ������ �ȳ� : http://blog.linkhub.co.kr/572                   }
{ - ������Ʈ ���� : 2017-12-05                                                 }
{ - ���� ������� ����ó : 1600-9854 / 070-4304-2991                           }
{ - ���� ������� �̸��� : code@linkhub.co.kr                                  }
{                                                                              }
{ <�׽�Ʈ �������� �غ����>                                                   }
{ (1) 37, 40�� ���ο� ����� ��ũ���̵�(LinkID)�� ���Ű(SecretKey)��          }
{    ��ũ��� ���Խ� ���Ϸ� �߱޹��� ���������� ����                           }
{ (2) �˺� ���߿� ����Ʈ(test.popbill.com)�� ����ȸ������ ����                 }
{ (3) ���ڼ��ݰ�꼭 ������ ���� ���������� ���                               }
{    - �˺�����Ʈ �α��� > [���ڼ��ݰ�꼭] ���� > ���� �ϴ���                 }
{      [ȯ�漳��] > [���������� ����] �޴� �̿�                                }
{    - ������������� �˾� URL (GetPopbillURL API)�� �̿��Ͽ� ���             }
{                                                                              }
{******************************************************************************}

unit Example;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TypInfo,
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
    btnGetCorpInfo: TButton;
    btnUpdateCorpInfo: TButton;
    btnListContact: TButton;
    btnSearchInfo: TButton;
    btnDetachStatement: TButton;
    btnAttachStatement: TButton;
    btnGetChargeInfo: TButton;
    btnGetPopbillURL_SEAL: TButton;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    btnGetBalance: TButton;
    btnGetPopbillURL_CHRG: TButton;
    btnGetPartnerBalance: TButton;
    btnGetPopbillURL_CERT: TButton;
    btnGetPartnerURL_CHRG: TButton;
    btnAssignMgtKey: TButton;
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
    procedure btnGetPopbillURL_SEALClick(Sender: TObject);
    procedure btnGetPartnerURL_CHRGClick(Sender: TObject);
    procedure btnAssignMgtKeyClick(Sender: TObject);
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

        //����ȯ�� ������, true(���߿�), false(�����)
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

Function BoolToStr(b:Boolean):String;
begin
    if b = true then BoolToStr:='True';
    if b = false then BoolToStr:='False';
end;

procedure TfrmExample.btnGetPopBillURLClick(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        {    �˺�(www.popbill.com)�� �α��ε� �˾� URL�� ��ȯ�մϴ�.           }
        {    URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.      }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text, 'LOGIN');
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
        {**********************************************************************}
        {    ��Ʈ���� ����ȸ������ ȸ�������� ��û�մϴ�.                      }
        {    ���̵� �ߺ�Ȯ���� btnCheckIDClick ���ν����� �����Ͻñ� �ٶ��ϴ�. }
        {**********************************************************************}

        // ��ũ���̵�
        joinInfo.LinkID := LinkID;

        // ����ڹ�ȣ '-' ����, 10�ڸ�
        joinInfo.CorpNum := '4364364364';

        // ��ǥ�ڼ���, �ִ� 30��
        joinInfo.CEOName := '��ǥ�ڼ���';

        // ��ȣ��, �ִ� 70��
        joinInfo.CorpName := '��ũ���';

        // �ּ�, �ִ� 300��
        joinInfo.Addr := '�ּ�';

        // ����, �ִ� 40��
        joinInfo.BizType := '����';

        // ����, �ִ� 40��
        joinInfo.BizClass := '����';

        // ���̵�, 6���̻� 20�� �̸�
        joinInfo.ID     := 'userid';

        // ��й�ȣ, 6���̻� 20�� �̸�
        joinInfo.PWD    := 'pwd_must_be_long_enough';

        // ����ڸ�, �ִ� 30��
        joinInfo.ContactName := '����ڸ�';

        // ����� ����ó, �ִ� 20��
        joinInfo.ContactTEL :='070-4304-2991';

        // ����� �޴�����ȣ, �ִ� 20��
        joinInfo.ContactHP := '010-000-1111';

        // ����� �ѽ���ȣ, �ִ� 20��
        joinInfo.ContactFAX := '02-6442-9700';

        // ����� ����, �ִ� 70��
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
        { - ���ݰ�꼭 �ӽ�����(Register API) ȣ���Ŀ��� ����(Issue API)��     }
        {   ȣ���ؾ߸� ����û���� ���۵˴ϴ�.                                  }
        { - �ӽ������ ������ �ѹ��� ȣ��� ó���ϴ� ��ù���(RegistIssue API) }
        {   ���μ����� �����մϴ�.                                             }
        { - ���ݰ�꼭 �׸� ������ "[���ڼ��ݰ�꼭 API �����Ŵ���] >        }
        {   4.1 (����)��꼭 ����" �� �����Ͻñ� �ٶ��ϴ�.                     }
        {**********************************************************************}

        
        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20170222';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] �������, [��������, ���ν��ڵ�����] �� ����
        // ���࿹��(Send API) ���μ����� �������� �ʴ°�� '��������' ����
        taxinvoice.issueTiming := '��������';         

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := '1234567890';

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ';

        // [�ʼ�] ������ ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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

        // ������� ���޹޴��ڿ��� ����ȳ����� ���ۿ���
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

        // [������� �ʼ�] ���޹޴��� ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // ������� �����ڿ��� ����ȳ����� ���ۿ���
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
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ��� 
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭�� ItemKey, ����Ȯ�� (GetInfo API)�� ������(ItemKey �׸�) Ȯ��.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ (serialNum) �� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���2';
        taxinvoice.detailList[1].spec := '�԰�';
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';


        {**********************************************************************}
        {                           �߰������ ����                            }
        { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
        { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
        {**********************************************************************}

        // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������
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
        { ����ȸ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ���������� �ƴ�       }
        { ��Ʈ�ʰ����� ��� ��Ʈ�� �ܿ�����Ʈ Ȯ��(GetPartnerBalance API)��    }
        { �̿��Ͻñ� �ٶ��ϴ�                                                  }
        {**********************************************************************}
        
        try
                balance := taxinvoiceService.GetBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnGetCertificateExpireDateClick(Sender: TObject);
var
        Expired : String;
begin
        {**********************************************************************}
        { �˺��� ��ϵǾ��ִ� ������������ �������ڸ� ��ȯ�մϴ�.              }
        { ��ϵ� ������������ ����/��߱�/��й�ȣ���� �Ǵ� ��� ��������      }
        { ���� �ϼž� ���������� API�� �̿��Ͻ� �� �ֽ��ϴ�.                 }  
        {**********************************************************************}

        try
                Expired := taxinvoiceService.GetCertificateExpireDate(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('������ ������ : '+ Expired);

end;

procedure TfrmExample.btnGetUnitCostClick(Sender: TObject);
var
        unitcost : Single;
begin
        {**********************************************************************}
        { ���ڼ��ݰ�꼭 ����� �����Ǵ� ����Ʈ �ܰ��� ��ȯ�մϴ�.             }
        {**********************************************************************}

        try
                unitcost := taxinvoiceService.GetUnitCost(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('���ݰ�꼭 ����ܰ� : '+ FloatToStr(unitcost));
end;

procedure TfrmExample.btnGetPartnerBalanceClick(Sender: TObject);
var
        balance : Double;
begin

        {**********************************************************************}
        { ��Ʈ���� �ܿ�����Ʈ�� Ȯ���մϴ�. ���ݹ���� ��Ʈ�ʰ����� �ƴ�       }
        { ���������� ��� ����ȸ�� �ܿ�����Ʈ Ȯ��(GetBalance API)��           }
        { �̿��Ͻñ� �ٶ��ϴ�                                                  }
        {**********************************************************************}

        try
                balance := taxinvoiceService.GetPartnerBalance(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�ܿ�����Ʈ : ' + FloatToStr(balance));

end;

procedure TfrmExample.btnDeleteClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1���� ���ڼ��ݰ�꼭�� [����]�մϴ�. ���ݰ�꼭�� ������ ��쿡��    } 
        { ����������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.                        }
        { - ���������� ���� ���� : [�ӽ�����], [�������], [���], [�ź�]      }
        {**********************************************************************}
        
        try
                response := taxinvoiceService.Delete(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text);
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
        { - ���ݰ�꼭�� ÷������ ����� [�ӽ�����] ���¿����� �����մϴ�.     }
        {   [����Ϸ�]���¿����� ÷�������� ��� �� �� �����ϴ�.               }
        { - ÷�������� �ִ� 5������ �߰��� �� �ֽ��ϴ�.                        }
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
        { ���ڼ��ݰ�꼭�� ÷�ε� ������ ����� Ȯ���մϴ�.                    }
        { - �����׸� �� ���Ͼ��̵�(AttachedFile)�� ���� ����(DeleteFile API)   }
        {   ȣ��� �̿��� �� �ֽ��ϴ�.                                         }
        {**********************************************************************}
        
        try
                filelist := taxinvoiceService.GetFiles(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

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

procedure TfrmExample.btnDeleteFileClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { ���ݰ�꼭�� ÷�ε� ������ �����մϴ�.                               }
        { ���Ͼ��̵�� ���ϸ�� (GetFiles API)�� �����׸��� ���Ͼ��̵�         }
        { (AttachedFile) ���� Ȯ���Ͽ� DeleteFile API ȣ��� �����Ͻø� �˴ϴ�.}
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
        { 1���� ���ݰ�꼭 ����/��� ������ Ȯ���մϴ�                         }
        { - ���ݰ�꼭 ��������(GetInfo API) �����׸� ���� �ڼ��� ������     }
        {  "[���ڼ��ݰ�꼭 API �����Ŵ���] > 4.2. (����)��꼭 �������� ����" }
        {  �� �����Ͻñ� �ٶ��ϴ�.                                             }
        {**********************************************************************}
        
        try
                taxinvoiceInfo := taxinvoiceService.getInfo(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | modifyCode | StateCode | TaxType | WriteDate | RegDT | OpenYN | OpenDT | lateIssueYN | InvoicerPrintYN | InvoiceePrintYN | closeDownState | closeDownStateDate | interOPYN ' + #13;

        tmp := tmp + taxinvoiceInfo.ItemKey + ' | '
                + taxinvoiceInfo.ModifyCode + ' | '
                + IntToStr(taxinvoiceInfo.StateCode) + ' | '
                + taxinvoiceInfo.TaxType + ' | '
                + taxinvoiceInfo.WriteDate + ' | '
                + taxinvoiceInfo.RegDT + ' | '
                + BoolToStr(taxinvoiceInfo.OpenYN) + ' | '
                + taxinvoiceInfo.OpenDT + ' | '
                + BoolToStr(taxinvoiceInfo.lateIssueYN) + ' | '
                + BoolToStr(taxinvoiceInfo.InvoicerPrintYN) + ' | '
                + BoolToStr(taxinvoiceInfo.InvoiceePrintYN) + ' | '
                + IntToStr(taxinvoiceInfo.closeDownState) + ' | '
                + taxinvoiceInfo.closeDownStateDate + ' | '
                + BoolToStr(taxinvoiceInfo.interOPYN)  + #13;
                
        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetInfosClick(Sender: TObject);
var
        KeyList : Array of String;
        InfoList : TTaxinvoiceInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { �ٷ��� ���ݰ�꼭 ����/��� ������ Ȯ���մϴ�. (�ִ� 1000��)         }
        { - ���ݰ�꼭 ��������(GetInfos API) �����׸� ���� �ڼ��� ������    }
        {  "[���ڼ��ݰ�꼭 API �����Ŵ���] > 4.2. (����)��꼭 �������� ����" }
        {  �� �����Ͻñ� �ٶ��ϴ�.                                             }
        {**********************************************************************}

        // ���ݰ�꼭 ����������ȣ �迭, �ִ� 1000�Ǳ��� ���簡��
        SetLength(KeyList,2);
        KeyList[0] := '20161221-03';
        KeyList[1] := '20161004-02';
        
        try
                InfoList := taxinvoiceService.getInfos(txtCorpNum.text, MgtKeyType, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'ItemKey | StateCode | TaxType | WriteDate | RegDT | lateIssueYN | InvoicerPrintYN | InvoiceePrintYN | closeDownState | closeDownStateDate | interOPYN' + #13;

        for i := 0 to Length(InfoList) -1 do
        begin
            tmp := tmp + InfoList[i].ItemKey + ' | '
                        + IntToStr(InfoList[i].StateCode) + ' | '
                        + InfoList[i].TaxType + ' | '
                        + InfoList[i].WriteDate + ' | '
                        + InfoList[i].RegDT + ' | '
                        + BoolToStr(InfoList[i].lateIssueYN) + ' | '
                        + BoolToStr(InfoList[i].InvoicerPrintYN) + ' | '
                        + BoolToStr(InfoList[i].InvoiceePrintYN) + ' | '
                        + IntToStr(InfoList[i].closeDownState) + ' | '
                        + InfoList[i].closeDownStateDate + ' | '
                        + BoolToStr(InfoList[i].interOPYN)  + #13;
        end;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnGetLogsClick(Sender: TObject);
var
        LogList : TTaxinvoiceLogList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ���ݰ�꼭 ���� �����̷��� Ȯ���մϴ�                                }
        { - ���� �����̷� Ȯ��(GetLogs API) �����׸� ���� �ڼ��� ������      }
        {  "[���ڼ��ݰ�꼭 API �����Ŵ���] > 3.6.4 ���� �����̷� Ȯ��"        }
        {  �� �����Ͻñ� �ٶ��ϴ�.                                             }
        {**********************************************************************}
        
        try
                LogList := taxinvoiceService.getLogs(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
        {**********************************************************************}
        { [�ӽ�����] ������ ���ݰ�꼭�� [���࿹��] ó���մϴ�.                }
        { - ���࿹���̶� �����ڿ� ���޹޴��� ���̿� ���ݰ�꼭 Ȯ�� �� �����ϴ�}
        {   ����Դϴ�.                                                        }
        { - "[���ڼ��ݰ�꼭 API �����Ŵ���] > 1.3.1. ������ ���μ��� �帧�� > }
        {   ��. �ӽ����� ���࿹��" �� ���μ����� �����Ͻñ� �ٶ��ϴ�.          }
        {**********************************************************************}

        
        // �޸�
        memo := '���࿹�� �޸�';

        // ���࿹�� �ȳ����� ����, �̱���� �⺻�������� ����
        emailSubject := '';  

        try
                response := taxinvoiceService.Send(txtCorpNum.text, MgtKeyType,
                                tbMgtKey.Text, memo, emailSubject);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnCancel_SendClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ���࿹�� ���ݰ�꼭�� [���]ó�� �մϴ�                              }
        { - [���]�� ���ݰ�꼭�� ����(Delete API)�ϸ� ��ϵ� ����������ȣ��   }
        {   ������ �� �ֽ��ϴ�.                                              }
        {**********************************************************************}
        
        // �޸�
        memo := '���࿹�� ��� �޸�';
        
        try
                response := taxinvoiceService.CancelSend(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnAcceptClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ���࿹�� ���ݰ�꼭�� [����]ó�� �մϴ�                              }
        {**********************************************************************}
        
        // �޸�
        memo := '���࿹�� ���� �޸�';

        try
                response := taxinvoiceService.Accept(txtCorpNum.text, MgtKeyType,
                                                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnDenyClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ���࿹�� ���ݰ�꼭�� [�ź�]ó�� �մϴ�                              }
        { - [�ź�]�� ���ݰ�꼭�� ����(Delete API)�ϸ� ��ϵ� ����������ȣ��   }
        {   ������ �� �ֽ��ϴ�.                                              }
        {**********************************************************************}

        // �޸�
        memo := '���࿹�� �ź� �޸�';
        
        try
                response := taxinvoiceService.Deny(txtCorpNum.text, MgtKeyType,
                        tbMgtKey.Text, memo);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnCancel_IssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin

        {**********************************************************************}
        { [����Ϸ�] ������ ���ݰ�꼭�� [�������] �մϴ�.                    }
        { - [�������]�� �ش� ���ݰ�꼭�� ����û ���������� �����մϴ�.       }
        { - [�������]�� ���ݰ�꼭�� ����û�� ���۵��� �ʽ��ϴ�.              }
        { - [�������] ���ݰ�꼭�� ����� ����������ȣ�� ���� �ϱ� ���ؼ��� }
        {   ����(Delete API)�� ȣ���Ͽ� [����] ó�� �ϼž� �մϴ�.             }
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
        response : TResponse;
        memo : String;
        emailSubject : String;
        forceIssue : Boolean;
begin
        {**********************************************************************}
        { [�ӽ�����] ������ ���ݰ�꼭�� [����]ó�� �մϴ�.                    }
        { - ����(Issue API)�� ȣ���ϴ� �������� ����Ʈ�� �����˴ϴ�.           }
        { - [����Ϸ�] ���ݰ�꼭�� ����ȸ���� ����û ���ۼ����� ����          }
        {    ����/������� ó���˴ϴ�. �⺻����(��������)                      }
        { - ����û ���ۼ����� "�˺� �α���" > [���ڼ��ݰ�꼭] > [ȯ�漳��] >  }
        {   [���ڼ��ݰ�꼭 ����] > [����û ���� �� �������� ����] �ǿ���      }
        {   Ȯ���� �� �ֽ��ϴ�.                                                }
        { - ����û ������å�� ���� ������ "[���ڼ��ݰ�꼭 API �����Ŵ���] >   }
        {   1.4. ����û ���� ��å" �� �����Ͻñ� �ٶ��ϴ�                      }
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

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnSendToNTSClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { [����Ϸ�] ������ ���ݰ�꼭�� ����û���� ������� �մϴ�.           }
        { - ����û ��������� ȣ������ ���� ��� [����Ϸ�] ������ ���ݰ�꼭��}
        {   ������ �������� ���� ���� 3�ÿ� �ϰ������� ����û���� ���۵˴ϴ�.  }
        { - �������۽� �������� ������������ ��� ���� �����Ͽ� ���۵˴ϴ�.    }
        { - ����û ���ۿ� ���� ������ "[API �����Ŵ���] > 1.4 ����û ���� ��å"}
        {   �� �����Ͻñ� �ٶ��ϴ�                                             }
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
        {**********************************************************************}
        { ���޹޴��ڰ� �����ڿ��� 1���� ��)���� ���ݰ�꼭�� �����û�մϴ�.   }
        { - ��)���� ���ݰ�꼭�� �����ϱ� ���ؼ��� ������/���޹޴��ڰ� ���    }
        {  �˺��� ȸ���̿��� �մϴ�.                                           }
        { - ��)���� ��û�� �����ڰ� [����] ó���� ����Ʈ�� �����Ǹ� ��)����    }
        {   ���ݰ�꼭 �׸��� ���ݹ���(ChargeDirection) �� ������  ���� ����   }
        {   "������"-�����ڰ��� "������"-���޹޴��ڰ��� ó���˴ϴ�.            }
        {**********************************************************************}

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

procedure TfrmExample.btnCancelRequestClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { ���޹޴��ڰ� ��û�� 1���� ��)���� ���ݰ�꼭�� [���] ó���մϴ�.    }
        { - [���]ó�� �� ���ݰ�꼭�� ����������ȣ�� ���� �ϱ� ���ؼ���     }
        {   ���� (Delete API) ȣ���ؾ� �մϴ�.                                 }
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

procedure TfrmExample.btnRefuseClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin
        {**********************************************************************}
        { �����ڰ� ��û���� ��)���� ���ݰ�꼭�� [�ź�] ó���մϴ�.            }
        { - [�ź�]ó�� �� ���ݰ�꼭�� ����������ȣ�� ���� �ϱ� ���ؼ���     }
        {   ���� (Delete API) ȣ���ؾ� �մϴ�.                                 }
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

procedure TfrmExample.btnReSendSMSClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
        contents : String;
begin
        {**********************************************************************}
        { �˸����ڸ� �����մϴ�. (�ܹ�/SMS- �ѱ� �ִ� 45��)                    }
        { - �˸����� ���۽� ����Ʈ�� �����˴ϴ�. (���۽��н� ȯ��ó��)         }
        { - ���۳��� Ȯ���� "�˺� �α���" > [���� �ѽ�] > [���۳���] �ǿ���    }
        {   ���۰���� Ȯ���� �� �ֽ��ϴ�.                                     }
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

procedure TfrmExample.btnReSendEmailClick(Sender: TObject);
var
        response : TResponse;
        email : String;
begin
        {**********************************************************************}
        { ���� �ȳ������� �������մϴ�.                                        }
        { - ���ϳ����� ���ڼ��ݰ�꼭 [����] ��ư�� �������� �ʴ� ���,        }
        {   Ű���� ���� Shift Ű�� ������ ��ư�� Ŭ���غ��ñ� �ٶ��ϴ�         }
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

procedure TfrmExample.btnSendInvoiceFaxClick(Sender: TObject);
var
        response : TResponse;
        sendNum : String;
        receiveNum : String;
begin
        {**********************************************************************}
        { ���ڼ��ݰ�꼭�� �ѽ������մϴ�.                                     }
        { - �ѽ� ���� ��û�� ����Ʈ�� �����˴ϴ�. (���۽��н� ȯ��ó��)        }
        { - ���۳��� Ȯ���� "�˺� �α���" > [���� �ѽ�] > [�ѽ�] > [���۳���]  }
        {   �޴����� ���۰���� Ȯ���� �� �ֽ��ϴ�.                            }
        {**********************************************************************}

        // �ѽ����� �߽Ź�ȣ
        sendNum := '070-111-222';

        // �����ѽ���ȣ
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



procedure TfrmExample.btnGetTaxinvoiceURL1Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺� > �ӽ�(����)������ �˾� URL�� ��ȯ�մϴ�.                       }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'TBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL2Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺� > ���� ������ �˾� URL�� ��ȯ�մϴ�.                            }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'SBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL3Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺� > ���� ������ �˾� URL�� ��ȯ�մϴ�.                            }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'PBOX');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetTaxinvoiceURL4Click(Sender: TObject);
var
        resultURL : String;
begin
        {**********************************************************************}
        { �˺� > ���� �����ۼ� �˾� URL�� ��ȯ�մϴ�.                          }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.GetURL(txtCorpNum.Text, 'WRITE');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopUpURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 1���� ���ڼ��ݰ�꼭 ���� �˾� URL�� ��ȯ�մϴ�.                     }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
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

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { 1���� ���ڼ��ݰ�꼭 �μ��˾� URL�� ��ȯ�մϴ�.                      }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
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

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetMailURLClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���޹޴��� ���ϸ�ũ URL�� ��ȯ�մϴ�.                                }
        { - ���ϸ�ũ URL�� ��ȿ�ð��� �������� �ʽ��ϴ�.                       }
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

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPrintsURLClick(Sender: TObject);
var
        KeyList : Array of String;
        resultURL : String;
begin
        {**********************************************************************}
        { �ټ����� ���ڼ��ݰ�꼭 �μ��˾� URL�� ��ȯ�մϴ�.                   }
        { - ������å���� ���� ��ȯ�� URL�� ��ȿ�ð��� 30���Դϴ�.              }
        {**********************************************************************}

        SetLength(KeyList,4);
        KeyList[0] := '20161004-01';
        KeyList[1] := '20161004-02';
        KeyList[2] := '20161004-03';
        KeyList[3] := '20161004-04';
        
        try
                resultURL := taxinvoiceService.getMassPrintURL(txtCorpNum.text,
                        MgtKeyType, KeyList);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
        {**********************************************************************}
        { ��뷮 �������� ���ϸ���� ��ȯ�մϴ�.                             }
        {**********************************************************************}

        try
                EmailPublicKeyList := taxinvoiceService.GetEmailPublicKeys(txtCorpNum.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
       
        {**********************************************************************}
        { - ���ݰ�꼭 ��)������ ������, ���޹޴��� ��� �˺� ȸ���� ��쿡��  }
        {   �����մϴ�.                                                        }
        { - ���ݰ�꼭 �׸� ������ "[���ڼ��ݰ�꼭 API �����Ŵ���] >        }
        {   4.1 (����)��꼭 ����" �� �����Ͻñ� �ٶ��ϴ�.                     }
        {**********************************************************************}


        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20170222';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, �������� ��� ����� ���޹޴�����
        // ����Ʈ�� �����Ǵ� '������' ����
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] �������, [��������, ���ν��ڵ�����] �� ����
        // ���࿹��(Send API) ���μ����� �������� �ʴ°�� '��������' ����
        taxinvoice.issueTiming := '��������';         

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

        // [�ʼ�] ������ ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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

        // ������� ���޹޴��ڿ��� ����ȳ����� ���ۿ���
        taxinvoice.invoicerSMSSendYN := false;


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

        // [������� �ʼ�] ���޹޴��� ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // ������� �����ڿ��� ����ȳ����� ���ۿ���
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
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ��� 
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭�� ItemKey, ����Ȯ�� (GetInfo API)�� ������(ItemKey �׸�) Ȯ��.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ (serialNum) �¤� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���2';
        taxinvoice.detailList[1].spec := '�԰�';
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';


        {**********************************************************************}
        {                           �߰������ ����                            }
        { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
        { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
        {**********************************************************************}

        // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������
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
        
        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnUpdateClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { [�ӽ�����] ������ ���ݰ�꼭�� �����׸��� �����մϴ�.                }
        { - ����û�� ������ �Ϸ�� ���ݰ�꼭�� ���� �Ǵ� �����ϱ� ���ؼ���    }
        {    [�������ݰ�꼭]�� �����ؾ� �մϴ�.                               }
        { - ���ݰ�꼭 �׸� ������ "[���ڼ��ݰ�꼭 API �����Ŵ���] >        }
        {   4.1 (����)��꼭 ����" �� �����Ͻñ� �ٶ��ϴ�.                     }
        {**********************************************************************}

        
        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20161004';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] �������, [��������, ���ν��ڵ�����] �� ����
        // ���࿹��(Send API) ���μ����� �������� �ʴ°�� '��������' ����
        taxinvoice.issueTiming := '��������';         

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := '1234567890';

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ_����';

        // [�ʼ�] ������ ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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

        // ������� ���޹޴��ڿ��� ����ȳ����� ���ۿ���
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

        // [������� �ʼ�] ���޹޴��� ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // ������� �����ڿ��� ����ȳ����� ���ۿ���
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
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ��� 
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭�� ItemKey, ����Ȯ�� (GetInfo API)�� ������(ItemKey �׸�) Ȯ��.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ (serialNum) �¤� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���2';
        taxinvoice.detailList[1].spec := '�԰�';
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';


        {**********************************************************************}
        {                           �߰������ ����                            }
        { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
        { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
        {**********************************************************************}

        // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';     // ����ڸ�

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //�Ϸù�ȣ, 1���� ��������
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

procedure TfrmExample.btnUpdate_ReverseClick(Sender: TObject);
var
        taxinvoice : TTaxinvoice;
        response : TResponse;
begin
        {**********************************************************************}
        { [�ӽ�����] ������ ��)���� ���ݰ�꼭�� �����׸��� �����մϴ�.        }
        { - ���ݰ�꼭 ������ [�ӽ�����]���¿����� �����մϴ�.                 }
        { - ���ݰ�꼭 �׸� ������ "[���ڼ��ݰ�꼭 API �����Ŵ���] >        }
        {   4.1 (����)��꼭 ����" �� �����Ͻñ� �ٶ��ϴ�.                     }
        {**********************************************************************}


        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20161004';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, �������� ��� ����� ���޹޴�����
        // ����Ʈ�� �����Ǵ� '������' ����
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] �������, [��������, ���ν��ڵ�����] �� ����
        // ���࿹��(Send API) ���μ����� �������� �ʴ°�� '��������' ����
        taxinvoice.issueTiming := '��������';         

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

        // [�ʼ�] ������ ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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

        // ������� ���޹޴��ڿ��� ����ȳ����� ���ۿ���
        taxinvoice.invoicerSMSSendYN := false;


        {**********************************************************************}
        {                            ���޹޴��� ����                           }
        {**********************************************************************}

        // [�ʼ�] ���޹޴��� ����, [�����, ����, �ܱ���] �� ����
        taxinvoice.invoiceeType := '�����';

        // [�ʼ�] ���޹޴��� ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoiceeCorpNum := '1234567890';

        // [�ʼ�] ���޹޴��� ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����        
        taxinvoice.invoiceeTaxRegID := '';

        // [�ʼ�] ���޹޴��� ��ȣ
        taxinvoice.invoiceeCorpName := '���޹޴��� ��ȣ';

        // [������� �ʼ�] ���޹޴��� ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // ������� �����ڿ��� ����ȳ����� ���ۿ���
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
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ��� 
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭�� ItemKey, ����Ȯ�� (GetInfo API)�� ������(ItemKey �׸�) Ȯ��.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ (serialNum) �¤� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[0].itemName := 'ǰ���';
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���2';
        taxinvoice.detailList[1].spec := '�԰�';
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';


        {**********************************************************************}
        {                           �߰������ ����                            }
        { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
        { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
        {**********************************************************************}

        // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';     // ����ڸ�

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //�Ϸù�ȣ, 1���� ��������
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[1].contactName := '�߰�����ڸ�2';    // ����ڸ�
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
        {***********************************************************************}
        { 1���� ���ݰ�꼭 ���׸��� Ȯ���մϴ�.                               }
        { - �����׸� ���� �ڼ��� ������ "[���ڼ��ݰ�꼭 API �����Ŵ���]      }
        { > 4.1 (����)��꼭 ����" �� �����Ͻñ� �ٶ��ϴ�.                      }
        {***********************************************************************}
        
        try
                taxinvoice := taxinvoiceService.getDetailInfo(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
        tmp := tmp +'closeDownState : ' +  IntToStr(taxinvoice.closeDownState) + #13;
        tmp := tmp +'closeDownStateDate : ' +  taxinvoice.closeDownStateDate + #13;


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
        {***********************************************************************}
        { ���ݰ�꼭�� �����ϱ��� ������ȣ �ߺ����θ� Ȯ���մϴ�.               }
        { - ������ȣ�� 1~24�ڸ� ����, ����, '-', '_' �������� �����Ҽ� �ֽ��ϴ�.}
        {***********************************************************************}

        try
                InUse := taxinvoiceService.CheckMgtKeyInUse(txtCorpNum.text, MgtKeyType, tbMgtKey.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        if InUse then ShowMessage('�����') else ShowMessage('�� �����.');
end;


procedure TfrmExample.btnGetEPrintUrlClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { ���ݰ�꼭 �μ�(���޹޴���) URL�� ��ȯ�մϴ�.                        }
        { - URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.       }
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

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.Button1Click(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { �ش� ������� ��Ʈ�� ����ȸ�� ���Կ��θ� Ȯ���մϴ�.                 }
        { - LinkID�� ���������� �����Ǿ� �ִ� ��ũ���̵� �Դϴ�. (37������)    }
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
        {**********************************************************************}
        { ȸ������(JoinMember API)�� ȣ���ϱ� �� ���̵� �ߺ��� Ȯ���մϴ�.     }
        {**********************************************************************}

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
        { ����ȸ���� ȸ�������� Ȯ���մϴ�.                                    }
        {**********************************************************************}

        try
                corpInfo := taxinvoiceService.GetCorpInfo(txtCorpNum.text, txtUserID.Text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'CorpName (��ȣ): ' + corpInfo.CorpName + #13;
        tmp := tmp + 'CeoName (��ǥ�� ����) : ' + corpInfo.CeoName + #13;
        tmp := tmp + 'BizType (����) : ' + corpInfo.BizType + #13;
        tmp := tmp + 'BizClass (����) : ' + corpInfo.BizClass + #13;
        tmp := tmp + 'Addr (�ּ�) : ' + corpInfo.Addr + #13;

        ShowMessage(tmp);

end;

procedure TfrmExample.btnUpdateCorpInfoClick(Sender: TObject);
var
        corpInfo : TCorpInfo;
        response : TResponse;
begin
        {**********************************************************************}
        { ����ȸ���� ȸ�������� �����մϴ�.                                    }
        {**********************************************************************}

        corpInfo := TCorpInfo.Create;

        // ��ǥ�ڸ�, �ִ� 30��
        corpInfo.ceoname := '��ǥ�ڸ�';

        // ��ȣ, �ִ� 70��
        corpInfo.corpName := '��ȣ';

        // ����, �ִ� 40��
        corpInfo.bizType := '����';

        // ����, �ִ� 40��
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

        ShowMessage(IntToStr(response.code) + ' | ' +  response.Message);
end;

procedure TfrmExample.btnListContactClick(Sender: TObject);
var
        InfoList : TContactInfoList;
        tmp : string;
        i : Integer;
begin
        {**********************************************************************}
        { ����ȸ���� ����� ����� Ȯ���մϴ�.                                 }
        {**********************************************************************}

        try
                InfoList := taxinvoiceService.ListContact(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;
        
        tmp := 'id | email | hp | personName | searchAllAllowYN | tel | fax | mgrYN | regDT' + #13;

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
        {**********************************************************************}
        { ����ȸ���� ����ڸ� �űԷ� ����մϴ�.                               }
        {**********************************************************************}

        // [�ʼ�] ����� ���̵� (6�� �̻� 20�� �̸�)
        joinInfo.id := 'testkorea0222_01';

        // [�ʼ�] ��й�ȣ (6�� �̻� 20�� �̸�)
        joinInfo.pwd := 'thisispassword';

        // [�ʼ�] ����ڸ�(�ѱ��̳� ���� 30�� �̳�)
        joinInfo.personName := '����ڼ���';

        // [�ʼ�] ����ó
        joinInfo.tel := '070-4304-2991';

        // �޴�����ȣ
        joinInfo.hp := '010-1111-2222';

        // �ѽ���ȣ
        joinInfo.fax := '02-6442-9700';
        
        // [�ʼ�] �̸���
        joinInfo.email := 'test@test.com';

        // ȸ����ȸ ���ѿ���, true-ȸ����ȸ / false-������ȸ
        joinInfo.searchAllAllowYN := false;

        // ������ ���ѿ���
        joinInfo.mgrYN := false;

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
        { ����ȸ���� ����� ������ �����մϴ�.                                 }
        {**********************************************************************}

        contactInfo := TContactInfo.Create;

        // ����� ���̵�
        contactInfo.id := 'testkorea';
        
        // ����ڸ�
        contactInfo.personName := '�׽�Ʈ �����';

        // ����ó
        contactInfo.tel := '070-4304-2991';

        // �޴�����ȣ
        contactInfo.hp := '010-4324-1111';

        // �̸��� �ּ�
        contactInfo.email := 'test@test.com';
        
        // �ѽ���ȣ
        contactInfo.fax := '02-6442-9799';

        // ��ȸ����, true(ȸ����ȸ), false(������ȸ)
        contactInfo.searchAllAllowYN := true;

        // �����ڱ��� ��������                                
        contactInfo.mgrYN := false;

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
        response : TResponse;
        writeSpecification : Boolean;
        forceIssue : Boolean;
        memo : String;
        emailSubject : String;
        dealInvoiceMgtKey : String;
begin

        {**********************************************************************}
        { 1���� ���ݰ�꼭�� ��ù��� ó���մϴ�. (����)                       }
        { - ���ݰ�꼭 �׸� ������ "[���ڼ��ݰ�꼭 API �����Ŵ���] >        }
        {   4.1 (����)��꼭 ����" �� �����Ͻñ� �ٶ��ϴ�.                     }
        {**********************************************************************}

        // ���ݰ�꼭 ��ü ����
        taxinvoice := TTaxinvoice.Create;

        // [�ʼ�] �ۼ�����, ǥ������ (yyyyMMdd) ex)20161004
        taxinvoice.writeDate := '20180312';

        // [�ʼ�] ��������, [������, ������, ����Ź] �� ����
        taxinvoice.issueType := '������';

        // [�ʼ�] [������, ������] �� ����, '������' �� ������ ���μ��������� �̿밡��
        // ������(������ ����), ������(���޹޴��� ����)
        taxinvoice.chargeDirection := '������';

        // [�ʼ�] ����/û��, [����, û��] �� ����
        taxinvoice.purposeType := '����';

        // [�ʼ�] �������, [��������, ���ν��ڵ�����] �� ����
        // ���࿹��(Send API) ���μ����� �������� �ʴ°�� '��������' ����
        taxinvoice.issueTiming := '��������';         

        // [�ʼ�] ��������, [����, ����, �鼼] �� ����
        taxinvoice.taxType :='����';


        {**********************************************************************}
        {                             ������ ����                              }
        {**********************************************************************}

        // [�ʼ�] ������ ����ڹ�ȣ, ������('-') ���� 10�ڸ�
        taxinvoice.invoicerCorpNum := '1234567890';

        // [�ʼ�] ������ ������� �ĺ���ȣ, �ʿ�� ���� 4�ڸ� ����
        taxinvoice.invoicerTaxRegID := '';

        // [�ʼ�] ������ ��ȣ
        taxinvoice.invoicerCorpName := '������ ��ȣ';

        // [�ʼ�] ������ ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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

        // ������� ���޹޴��ڿ��� ����ȳ����� ���ۿ���
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

        // [������� �ʼ�] ���޹޴��� ����������ȣ, 1~24�ڸ� (����, ����, '-', '_') ��������
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
        taxinvoice.invoiceeEmail1 := 'test@test.com';

        // ���޹޴��� ����ó
        taxinvoice.invoiceeTEL1 := '070-4304-2991';

        // ���޹޴��� �޴�����ȣ
        taxinvoice.invoiceeHP1 := '010-0000-222';

        // ������� �����ڿ��� ����ȳ����� ���ۿ���
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
        taxinvoice.kwon := '1';

        // ���� �� 'ȣ' �׸�, �ִ밪 32767
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
        { [����] �������ݰ�꼭 �ۼ���� �ȳ� - http://blog.linkhub.co.kr/650  }
        {**********************************************************************}

        // ���������ڵ�, ������������ 1~6�� ���ñ��� 
        taxinvoice.modifyCode := '';

        // �������ݰ�꼭�� ItemKey, ����Ȯ�� (GetInfo API)�� ������(ItemKey �׸�) Ȯ��.
        taxinvoice.originalTaxinvoiceKey := '';

        
        {**********************************************************************}
        {                        ���׸�(ǰ��) ����                           }
        {**********************************************************************}

        // ���׸� 0~99�� ���� �ۼ�����.
        // �Ϸù�ȣ (serialNum) �¤� 1���� 99���� ��������.
        // SetLength�� �ʱ�ȭ ���� ����.
        setLength(taxinvoice.detailList, 2);

        taxinvoice.detailList[0] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[0].serialNum := 1;                //�Ϸù�ȣ
        taxinvoice.detailList[0].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[0].itemName := copy('����$������ĥ�ȱ���', 1, 8);
        taxinvoice.detailList[0].spec := '�԰�';
        taxinvoice.detailList[0].qty := '1';                    //����
        taxinvoice.detailList[0].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[0].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[0].tax := '10000';                //����
        taxinvoice.detailList[0].remark := '���';

        taxinvoice.detailList[1] := TTaxinvoiceDetail.Create;
        taxinvoice.detailList[1].serialNum := 2;                //�Ϸù�ȣ
        taxinvoice.detailList[1].purchaseDT := '20161004';      //�ŷ�����
        taxinvoice.detailList[1].itemName := 'ǰ���2';
        taxinvoice.detailList[1].spec := '�԰�';
        taxinvoice.detailList[1].qty := '1';                    //����
        taxinvoice.detailList[1].unitCost := '100000';          //�ܰ�
        taxinvoice.detailList[1].supplyCost := '100000';        //���ް���
        taxinvoice.detailList[1].tax := '10000';                //����
        taxinvoice.detailList[1].remark := '���';


        {**********************************************************************}
        {                           �߰������ ����                            }
        { ���ݰ�꼭 ����ȳ������� ���Ź޾ƾ� �ϴ� ����ڰ� �ټ��� ��� �߰���}
        { ����� ������ �����Ͽ� ����ȳ������� ���۹����� �ֽ��ϴ�.           }
        {**********************************************************************}

        // �߰������ �迭�ʱ�ȭ, �ִ� 5������ ���� ����
        SetLength(taxinvoice.addContactList,2);

        taxinvoice.addContactList[0] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[0].serialNum := 1;    // �Ϸù�ȣ, 1���� ��������
        taxinvoice.addContactList[0].email := 'test2@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[0].contactName := '�߰�����ڸ�';     // ����ڸ�

        taxinvoice.addContactList[1] := TTaxinvoiceAddContact.Create;
        taxinvoice.addContactList[1].serialNum := 2;    //�Ϸù�ȣ, 1���� ��������
        taxinvoice.addContactList[1].email := 'test3@invoicee.com';     // �����ּ�
        taxinvoice.addContactList[1].contactName := '�߰�����ڸ�2';    // ����ڸ�


        // �ŷ����� �����ۼ� ����
        writeSpecification := false;

        // �ŷ����� �����ۼ��� ���� ����������ȣ, 1~24�ڸ� ����,����,'-','_' �������� ����
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

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

procedure TfrmExample.btnCancelIssueClick(Sender: TObject);
var
        response : TResponse;
        memo : String;
begin

        {**********************************************************************}
        { [����Ϸ�] ������ ���ݰ�꼭�� ������� ó���մϴ�.                  }
        { - [�������] ���ݰ�꼭�� ����û�� ���۵��� �ʽ��ϴ�.                }
        { - [�������] ���ݰ�꼭�� ����������ȣ�� �����ϱ� ���ؼ��� ����    }
        {   (Delete API) �� ȣ���Ͽ� ���� ó���� �ؾ� �մϴ�.                  }
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

procedure TfrmExample.btnDelete_RegistIssueClick(Sender: TObject);
var
        response : TResponse;
begin
        {**********************************************************************}
        { 1���� ���ڼ��ݰ�꼭�� [����]�մϴ�. ���ݰ�꼭�� ������ ��쿡��    } 
        { ����������ȣ(mgtKey)�� ���� �� �� �ֽ��ϴ�.                        }
        { - ���������� ���� ���� : [�ӽ�����], [�������], [���], [�ź�]      }
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

procedure TfrmExample.btnGetPopbillURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        {    ����ȸ�� ����Ʈ ���� URL�� ��ȯ�մϴ�.                            }
        {    URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.      }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnGetPopbillURL_CERTClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        {    ���������� ���  URL�� ��ȯ�մϴ�.                                }
        {    URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.      }
        {**********************************************************************}

        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text, 'CERT');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
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
        IssueType : Array Of String;
        LateOnly : String;
        TaxRegIDYN : String;
        TaxRegIDType : String;
        TaxRegID : String;
        QString : String;
        Page : Integer;
        PerPage : Integer;
        Order : String;
        InterOPYN : String;
        tmp : String;
        SearchList : TSearchList;
        i : Integer;
begin
        {**********************************************************************}
        { �˻������� ����Ͽ� ���ݰ�꼭 ����� ��ȸ�մϴ�.                    }
        { - �����׸� ���� �ڼ��� ������ "[���ڼ��ݰ�꼭 API �����Ŵ���] >   }
        {   4.2. (����)��꼭 �������� ����" �� �����Ͻñ� �ٶ��ϴ�.           }
        {**********************************************************************}
        

        // [�ʼ�] �������� { R : ����Ͻ�, W : �ۼ�����, I : �����Ͻ� } �� ����
        DType := 'W';

        // [�ʼ�] ��������, �ۼ�����(yyyyMMdd)
        SDate := '20171101';

        // [�ʼ�] ��������, �ۼ�����(yyyyMMdd)
        EDate := '20171231';

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
        TaxType[1] := 'Z';
        TaxType[2] := 'N';

        // �������� �迭, {N:������, R:������, T:����Ź) ���ñ���
        SetLength(IssueType, 3);
        IssueType[0] := 'N';
        IssueType[1] := 'R';
        IssueType[2] := 'T';

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
                                        Order, InterOPYN, txtUserID.text);
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

        tmp := tmp + 'WriteDate | invoicerMgtKey | StateCode | TaxType |  RegDT | lateIssueYN | invoicerCorpNum |  invoicerCorpName | invoiceeCorpNum | invoiceeCorpName | '
                + ' issueType | supplyCostTotal | taxTotal | invoicerPrintYN | invoiceePrintYN | closeDownState | closeDownStateDate | interOPYN '+#13#13;

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
                        + IntToStr(SearchList.list[i].closeDownState) + ' | '
                        + SearchList.list[i].closeDownStateDate + ' | '                        
                        + BoolToStr(SearchList.list[i].interOPYN) + #13;
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
        {**********************************************************************}
        { �˺��� ��ϵ� 1���� ���ڸ����� ���ݰ�꼭�� ÷���մϴ�.            }
        {**********************************************************************}
        
        // ÷���� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷���� ���ڸ��� ����������ȣ
        SubMgtKey := '20151223-01';

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
        { ���ݰ�꼭�� ÷�ε� ���ڸ��� 1���� ÷�������մϴ�.                 }
        {**********************************************************************}

        // ÷�������� ���ڸ��� ���������ڵ�, 121-�ŷ�����, 122-û���� 123-������, 124-���ּ�, 125-�Ա�ǥ, 126-������
        SubItemCode := 121;

        // ÷�������� ���ڸ��� ����������ȣ
        SubMgtKey := '20151223-01';
        
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
        { ����ȸ���� ���ڼ��ݰ�꼭 API ���� ���������� Ȯ���մϴ�.          }
        {**********************************************************************}

        try
                chargeInfo := taxinvoiceService.GetChargeInfo(txtCorpNum.text);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        tmp := 'unitCost (�ܰ�) : ' + chargeInfo.unitCost + #13;
        tmp := tmp + 'chargeMethod (��������) : ' + chargeInfo.chargeMethod + #13;
        tmp := tmp + 'rateSystem (��������) : ' + chargeInfo.rateSystem + #13;

        ShowMessage(tmp);
end;

procedure TfrmExample.btnGetPopbillURL_SEALClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        { �ΰ� �� ÷�ι��� ���  URL�� ��ȯ�մϴ�.                             }
        { URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.         }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPopbillURL(txtCorpNum.Text, 'SEAL');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;


procedure TfrmExample.btnGetPartnerURL_CHRGClick(Sender: TObject);
var
  resultURL : String;
begin
        {**********************************************************************}
        {    ��Ʈ�� ����Ʈ���� �˾� URL�� ��ȯ�մϴ�.                          }
        {    URL ������å�� ���� ��ȯ�� URL�� 30���� ��ȿ�ð��� �����ϴ�.      }
        {**********************************************************************}
        
        try
                resultURL := taxinvoiceService.getPartnerURL(txtCorpNum.Text, 'CHRG');
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('ResultURL is ' + #13 + resultURL);
end;

procedure TfrmExample.btnAssignMgtKeyClick(Sender: TObject);
var
        response : TResponse;
        mgtKey, itemKey : String;
        keyType : EnumMgtKeyType;
begin
        {**********************************************************************}
        { �˺�����Ʈ���� �ۼ��� ���ݰ�꼭�� ��Ʈ�� ����������ȣ�� �Ҵ��մϴ�. }
        {**********************************************************************}

        // ���ݰ�꼭 ����, SELL-����, BUY-����, TRUSTEE-����Ź
        keyType := SELL;

        // ���ݰ�꼭 ������Ű, ���� �����ȸ(Search) API�� ��ȯ�׸��� ItemKey ����
        itemKey := '018022712201300001';

        // �Ҵ��� ����������ȣ, ����, ���� '-', '_' �������� 1~24�ڸ�����
        // ����ڹ�ȣ�� �ߺ����� ������ȣ �Ҵ�
        mgtKey := '20180312-02';

        try
                response := taxinvoiceService.AssignMgtKey(txtCorpNum.text, MgtKeyType, itemKey, mgtKey);
        except
                on le : EPopbillException do begin
                        ShowMessage('�����ڵ� : '+ IntToStr(le.code) + #10#13 +'����޽��� : '+  le.Message);
                        Exit;
                end;
        end;

        ShowMessage('�����ڵ� : '+ IntToStr(response.code) + #10#13 +'����޽��� : '+  response.Message);
end;

end.
