# -*- coding: utf-8 -*-

import projpet_db, projpet_scrape,collections,peewee,json,datetime
import time
  
def main():
      pdb = projpet_db.Project_db()
      ps = projpet_scrape.Project_scrape()
      
      print "connecting to database"
      tablelist = []
      issuelist = []
      resplist = []
      signlist = []
      tablelist = pdb.database_conn()
      
      print "db connection established and model created"
      
      
      petlist = []
      petlist = ps.petition_extract()
      print "extracted petitions from file"
      
             
      for dict1 in petlist:
       petitionid = tablelist[0].select().where(dict1['id'] == tablelist[0].id)
        
       try:
        
        tablelist[0].create(id = dict1['id'],type=dict1['type'],title=dict1['title'],body = dict1['body'],signature_threshold=dict1['signature_threshold'],
        signature_count=dict1['signature_count'],signatures_needed=dict1['signatures_needed'],url=dict1['url'],deadline=datetime.date.fromtimestamp(dict1['deadline']),status=dict1['status'],
        created=datetime.date.fromtimestamp(dict1['created']))
       except:
        print dict1['id']+ "petition already exists in db"
      time.sleep(3)
            
      print "wtp_data_petitions done"
      
      
     
      pets = (tablelist[0].select())
      
    
      

      for pet in pets:
          
          print pet.id 
          petid = pet.id 
                 
          issuelist = ps.issues_extract(petid)
          
          for dict1 in issuelist:
              try:
                
                tablelist[1].create(id = dict1['id'],name = dict1['name'])
                
              except:
                print str(dict1['id'])+"issue already exists in db"
              try:
                tablelist[2].create(petition_id = str(petid), issue_id = dict1['id'])
              except:
                  print "already associated"
          time.sleep(2)
          
          print "wtp_data_issues done"
      
          resplist = ps.response_extract(petid)
          for dict1 in resplist:
              try:
                  
                  tablelist[4].create(url = dict1['url'],id = dict1['id'])
                 
                  
              except:
                  print "response already exists in db"
              try:
                tablelist[3].create(petition_id = str(petid), response_id = dict['id'], associationtime = datetime.date.fromtimestamp(dict1['associationtime']))
              except:
                  print "already associated"
          time.sleep(2)
           
          signlist = ps.signatures_extract(petid)
          try:
           for dict1 in signlist:
        
              tablelist[5].create(id = dict1['id'],
              petition_id = dict1['petition_id'],
              type = dict1['type'],
              name = dict1['name'],
              city = dict1['city'],
              state = dict1['state'],
              zip = dict1['zip'],
              created = datetime.date.fromtimestamp(dict1['created']))
          except:
              print "the signatures of "+str(petid)+" already in db"
              
              
          time.sleep(2)
          
          
      print "Loop around petitions completed"      
   

          

if __name__ =='__main__':

    main()        
      
      
      
      


 

        
