CREATE TABLE IF NOT EXISTS 
    PARTY(ID INTEGER PRIMARY KEY AUTOINCREMENT, 
    HASHID TEXT UNIQUE, SALT TEXT, NAME TEXT NOT NULL, 
    PTYPE TEXT CHECK (PTYPE IN ('GIVER','TAKER','WITNESS','ATTORNEY','THIRDPARTY','REFEREE')), 
    STDATE DATETIME DEFAULT CURRENT_TIMESTAMP, 
    ENDDATE DATETIME); 

CREATE TABLE IF NOT EXISTS 
    ASSET(ID INTEGER PRIMARY KEY AUTOINCREMENT, 
    HASHID TEXT UNIQUE, SALT TEXT, NAME TEXT NOT NULL, 
    LOCATION TEXT NOT NULL, METADATA TEXT NOT NULL, 
    ATYPE TEXT CHECK (ATYPE IN ('TANGIBLE','VIRTUAL','DIGITAL','INTANGIBLE')), 
    ASSETTAG TEXT, 
    QUANTITY REAL NOT NULL, 
    ASSET_VALUE REAL NOT NULL, 
    STDATE DATETIME DEFAULT CURRENT_TIMESTAMP, 
    EXPDATE DATETIME, 
    BOMPORTFOLIO TEXT ); 
    
CREATE TABLE IF NOT EXISTS 
    AGREEMENT(ID INTEGER PRIMARY KEY AUTOINCREMENT, 
    HASHID TEXT UNIQUE, 
    SALT TEXT, 
    NAME TEXT NOT NULL, 
    SLA TEXT, 
    WARRANTY TEXT, 
    ATYPE TEXT CHECK (ATYPE IN ('BINDING','NONBINDING','TRACEABLE','POLICY')), 
    AGREED_VALUE REAL NOT NULL, 
    STDATE DATETIME DEFAULT CURRENT_TIMESTAMP, 
    EXPDATE DATETIME DEFAULT CURRENT_TIMESTAMP); 
    
CREATE TABLE IF NOT EXISTS 
    LEDGER(ID INTEGER PRIMARY KEY AUTOINCREMENT, 
    HASHID TEXT UNIQUE, 
    SALT TEXT, 
    GIVER TEXT, 
    TAKER TEXT, 
    ASSET TEXT, 
    AGREEMENT TEXT,
    TRAN_AMT REAL, 
    TRAN_QNTY REAL, 
    JOURNAL_TYPE TEXT CHECK (JOURNAL_TYPE IN ('JOURNAL', 'VOUCHER', 'IOU', 'REDEMPTION', 'LEASE')), 
    TRAN_TYPE TEXT CHECK (TRAN_TYPE IN ('REWARD', 'AQUISITION', 'LEND', 'BORROW', 'WIN', 'MERGE', 'VIEW', 'VOTE')));

SELECT name, hashid FROM party  UNION SELECT name, hashid, ASSET_VALUE from asset;