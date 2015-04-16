using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace Synchronic_World
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "EventService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select EventService.svc or EventService.svc.cs at the Solution Explorer and start debugging.
    public class EventService : IEventService
    {
        Model1Container context;
        EventService() 
        {
            context = new Model1Container();
            //Cause some problems. must disable lazyload.(Foreign key)
            context.Configuration.LazyLoadingEnabled = true;
            context.Configuration.ProxyCreationEnabled = false;

        }
        public Event AddNewEvent(string name, string address, string description, DateTime date, DateTime time, string eventType)
        {
            eventType = eventType.ToLower();
            EventType tmp ;
            EventType t = context.EventTypeSet.Where(m=>m.NameOfType==eventType).FirstOrDefault();
            if(t==null)
            {
                tmp = new EventType{NameOfType = eventType};
            }else
            {
                tmp = t;
            }

            //0 means pending   -1 means closed   1 means opening
            EventStatus eS = new EventStatus { Status = 0 };
            Event eVent = new Event
            {
                Name = name,
                Address = address,
                Description = description,
                Date = date,
                Time = time,
                EventType = tmp,
                EventStatus = eS
            };
            context.EventSet.Add(eVent);
            context.SaveChanges();
            return eVent;
        }
        public IEnumerable<Event> RetrieveAllEvent() 
        {
            return context.EventSet.Include("EventStatus").ToList();
        }
    }
}