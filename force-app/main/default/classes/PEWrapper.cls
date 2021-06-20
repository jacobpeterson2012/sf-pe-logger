public with sharing class PEWrapper {
    public static List<PEWrapper> mapTo(List<SObject> events) {
        List<PEWrapper> result = new List<PEWrapper>();
        for (SObject s : events) {
            result.add(new PEWrapper(s));
        }
        return result;
    }

    public String createdById {
        get {
            if (String.isBlank(createdById)) {
                createdById = (String) pe.get('createdById');
            }
            return createdById;
        }
        set;
    }
    public String eventUuid {
        get {
            if (String.isBlank(EventUuid)) {
                eventUuid = (String) pe.get('EventUuid');
            }
            return EventUuid;
        }
        set;
    }
    public DateTime createdDate {
        get {
            if (createdDate == null) {
                createdDate = (DateTime) pe.get('createdDate');
            }
            return createdDate;
        }
        set;
    }

    public String type {
        get {
            if (type == null) {
                type = (String) this.getAttribute('type');
            }
            return type;
        }
        set;
    }
    public String url {
        get {
            if (url == null) {
                url = (String) this.getAttribute('url');
            }
            return url;
        }
        set;
    }
    public String replayId {
        get {
            if (String.isBlank(replayId)) {
                replayId = (String) pe.get('ReplayId');
            }
            return replayId;
        }
        set;
    }
    private Map<String, Object> untypedPE {
        get {
            if (untypedPE == null) {
                untypedPE = (Map<String, Object>) JSON.deserializeUntyped(this.rawJSON);
            }
            return untypedPE;
        }
        set;
    }
    private SObject pe;

    public String rawJSON {
        get {
            if (String.isBlank(rawJSON)) {
                rawJSON = JSON.serialize(pe);
            }
            return rawJSON;
        }
        set;
    }

    public PEWrapper(SObject pe) {
        this.pe = pe;
    }

    private Object getAttribute(String attributeName) {
        final String ATTRIBUTES_KEY = 'attributes';

        if (!this.untypedPE.containsKey(ATTRIBUTES_KEY)) {
            return null; //Exception
        }

        Map<String, Object> attributes = (Map<String, Object>) this.untypedPE.get(ATTRIBUTES_KEY);
        return attributes.get(attributeName);
    }
}
