object dtmConexao: TdtmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 216
  Width = 725
  object ConexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Connected = True
    HostName = '.\SQL2014'
    Port = 1433
    Database = 'vendas'
    User = 'sa'
    Password = '2014'
    Protocol = 'mssql'
    LibraryLocation = 'C:\Workspace\Andamento\ERP_SQLServer\ntwdblib.dll'
    Left = 424
    Top = 120
  end
end