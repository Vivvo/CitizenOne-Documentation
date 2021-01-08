*************************
Using the Tempate System
*************************

Vivvo uses github source control.  Our developers work with your UI/UX team to replace placeholder information with system tagging.  The workflow to achieve this is as follows:

.. graphviz::

    digraph Workflow {
    position=center
    node [shape=plaintext]
    labelloc = "t"; 
       "clone the repository to your local machine" -> "create a feature branch" -> "make your edits" -> "commit the new branch to source control" -> "create a pull request" [color=blue]
    }

Using the github tools:

.. code-block:: HTML
   :linenos:

   git clone https://github.com/Vivvo/{{your template registry}}
   cd {{your template registry}}
   git checkout -b "template changes"
   # make your edits
   git add **
   git commit -m "edits to html and style"
   git push 
   

Tagging reffers to adding logic that will add the right context to the page.   In your templates, your placeholder information may say "Jane Doe", and the Vivvo developers will replace this with {{ profile.FirstName profile.LastName }} for example. 

Your template before tagging will look like this:

.. code-block:: HTML
   :linenos:

    <div class=" row col-lg-4 ml-1">
                    <h1>Welcome to your Account Login Tom Sawyer </h1>
                    <h3>Your portal to personalized, simple and secure service.</h3>
                </div>
                <div class="card col-lg-4 mt-5">
                    <div class="card-body contact-box">
                        <div>
                            <div class="ml-4 mb-4">
                                <h2>Questions Contact Us: </h2>
                                <p>
                                </p>
                            </div>
                        </div>

And after the tagging is added

.. code-block:: HTML
   :linenos:

    <div class=" row col-lg-4 ml-1">
                    <h1>Welcome to your Account Login {{ .me.FirstName .me.LastName }} </h1>
                    <h3>Your portal to personalized, simple and secure service.</h3>
                </div>
                <div class="card col-lg-4 mt-5">
                    <div class="card-body contact-box">
                        <div>
                            <div class="ml-4 mb-4">
                                <h2>Questions Contact Us: </h2>
                                <p>
                                </p>
                            </div>
                        </div>

The .me part of the tag is a data object that is created from the controller.  Data objects can be a single object, an object with embedded objects or a list.  The .me for example is an object instantiated in the controller and attached to a view argument called "me".  The me object represents the user in context, and attributes of the user can be displayed by accessors such as:

* .me.FirstName
* .me.Address[0].Street
* .me.Phone[0].number

As examples.

Data objects that are available to views are found below.  Not all objects are available to all pages, but rather exposed to the relevant page. (e.g. profile objects are exposed to the profile pages, and service card objects are exposed to service card pages.  Objects the templates can be found in `Appendix A`_

Vivvo makes use of default template functions defined in the `<https://revel.github.io/manual/templates.html>`_ webpage, and we create some custom ones for rendering special blocks.  Examples are found in `Appendix B`_

##########
Appendix A
##########
.. code-block:: go 
   :linenos:

   type ConsentModel struct {
	HasConsent  bool     `json:"hasConsent"`
	Scopes      []string `json:"scopes"`
	ExpiresOn   string   `json:"expiresOn"`
	CreatedDate string   `json:"createdDate"`
    }

    type GrantedConsentModel struct {
        ServiceCardId     string   `json:"serviceCardId"`
        PolicyId          string   `json:"policyId"`
        consentExpiryDate string   `json:"consentExpiryDate"`
        Scopes            []string `json:"scopes"`
    }

    type IdentityServiceCard struct {
        IdentityServiceCardId int64        `json:"identityServiceCardId"`
        IdentityId            string       `json:"identityId"`
        ServiceCardId         string       `json:"serviceCardId"`
        SortOrder             int64        `json:"sortOrder"`
        FatServiceCard        *ServiceCard `json:"serviceCard"`
        LightServiceCard      *ServiceCard `json:"lightServiceCard"`
        NotificationCount     int          `json:"notificationCount"`
    }

    type MaintenanceMessage struct {
        MaintenanceId int    `json:"maintenanceId"`
        Title         string `json:"title"`
        Details       string `json:"details"`
        StartDate     string `json:"startDate"`
        EndDate       string `json:"endDate"`
    }

    type Me struct {
        Identity           Identity `json:"identity"`
        Business           string   `json:"business,omitempty"`
        HasBusinessConnect bool     `json:"hasBusinessConnect,omitempty"`
        RedirectUrls       []Link   `json:"links,omitempty"`
    }

    type Identity struct {
        IdentityId               string                    `json:"identityId"`
        FirstName                string                    `json:"firstName"`
        LastName                 string                    `json:"lastName"`
        MiddleName               string                    `json:"middleName"`
        UserName                 string                    `json:"userName"`
        Salutation               string                    `json:"salutation,omitempty"`
        DateOfBirth              string                    `json:"dateOfBirth,omitempty"`
        SupportCode              string                    `json:"supportCode,omitempty"`
        AssuranceLevel           AssuranceLevel            `json:"assuranceLevel"`
        Emails                   []Email                   `json:"emails"`
        Phones                   []Phone                   `json:"phones"`
        Addresses                []Address                 `json:"addresses"`
        SecondaryAuthentications []SecondaryAuthentication `json:"secondaryAuthentication"`
        ExternalIdentifiers      []ExternalIdentifiers     `json:"externalIdentifiers"`
    }

    type ExternalIdentifiers struct {
        Name     string `json:"name"`
        Value    string `json:"value"`
        Provider string `json:"provider"`
    }

    type SecondaryAuthentication struct {
        SecondaryAuthenticationId     int    `json:"secondaryAuthenticationId"`
        SecondaryAuthenticationType   string `json:"secondaryAuthenticationType"`
        SecondaryAuthenticationStatus string `json:"secondaryAuthenticationStatus"`
        IdentityId                    string `json:"identityId"`
        PhoneId                       int    `json:"phoneId"`
        Url                           string `json:"url"`
        IsGlobal                      bool   `json:"isGlobal"`
    }

    type AssuranceLevel struct {
        Level         int           `json:"level"`
        ClaimProvider ClaimProvider `json:"claimProvider"`
        IdentityId    string        `json:"identityId"`
    }

    type ClaimProvider struct {
        ClaimProviderId      int      `json:"claimProviderId"`
        Name                 string   `json:"name"`
        Description          string   `json:"description"`
        OnboardingIdentifier string   `json:"onBoardingIdentifier"`
        BaseUrl              string   `json:"baseUrl"`
        OnboardingParams     []string `json:"onboardingParams"`
        Loa                  int      `json:"loa"`
        OnboardingPath       string   `json:"onboardingPath"`
        LogoUrl              string   `json:"logoUrl"`
        Prerequisites        []string `json:"prerequisites"`
    }

    type Link struct {
        Name string `json:"name"`
        URL  string `json:"url"`
    }

    type Notification struct {
        NotificationId   int64  `json:"notificationId"`
        ApplicationName  string `json:"applicationName"`
        OrganizationName string `json:"organizationName"`
        Subject          string `json:"subject"`
        Body             string `json:"body"`
        NotificationDate string `json:"notificationDate"`
        Status           string `json:"status"`
        FolderType       string `json:"folderType"`
        ReferenceNumber  string `json:"referenceNumber"`
        Recipient        string `json:"recipient"`
    }

    type PolicyCallback struct {
        PolicyCallbackId    int64  `json:"policyCallbackId,omitempty"`
        PolicyId            string `json:"policyId,omitempty"`
        RevisionNum         int64  `json:"revisionNum,omitempty"`
        DataBundleType      string `json:"dataBundleType,omitempty"`
        Url                 string `json:"url,omitempty"`
        ConsentScopeGranted bool   `json:"consentScopeGenerated,omitempty"`
    }

    type Policy struct {
        PolicyId          string         `json:"policyId"`
        Name              string         `json:"name"`
        Description       string         `json:"description,omitempty"`
        PublicKey         string         `json:"publicKey,omitempty"`
        DefaultExpiryDays int            `json:"defaultExpiryDays,omitempty"`
        ActiveRevision    PolicyRevision `json:"activeRevision,omitempty"`
    }

    type PolicyRevision struct {
        PolicyId    string           `json:"policyId,omitempty"`
        RevisionNum int              `json:"revisionNum,omitempty"`
        PolicyText  string           `json:"policyText,omitempty"`
        IsActive    bool             `json:"isActive,omitempty"`
        CreatedDate string           `json:"createdDate,omitempty"`
        Callbacks   []PolicyCallback `json:"callbacks,omitempty"`
        Scopes      []PolicyScope    `json:"scopes,omitempty"`
        Rules       []PolicyRule     `json:"rules,omitempty"`
    }

    type PolicyRule struct {
        PolicyRuleId   int64    `json:"policyRuleId,omitempty"`
        PolicyId       string   `json:"policyId,omitempty"`
        RevisionNum    int64    `json:"revisionNum,omitempty"`
        PolicyRuleType string   `json:"policyRuleType,omitempty"`
        RuleId         int64    `json:"ruleId,omitempty"`
        Args           []string `json:"args,omitempty"`
    }

    type PolicyScope struct {
        PolicyScopeId  int64    `json:"policyScopeId,omitempty"`
        PolicyId       string   `json:"policyId,omitempty"`
        RevisionNum    int64    `json:"revisionNum,omitempty"`
        Value          string   `json:"value,omitempty"`
        Description    string   `json:"description,omitempty"`
        Tag            string   `json:"tag,omitempty"`
        Reason         string   `json:"reason,omitempty"`
        IsRequired     bool     `json:"isRequired,omitempty"`
        Consented      bool     `json:"consented,omitempty"`
        IncludedFields []string `json:"includedFields,omitempty"`
    }

    type Address struct {
        AddressId    int    `json:"addressId,omitempty"`
        IdentityId   string `json:"identityId"`
        AddressType  string `json:"addressType"`
        PersonaType  string `json:"personaType"`
        AddressLine1 string `json:"addressLine1"`
        AddressLine2 string `json:"addressLine2"`
        City         string `json:"city"`
        ProvinceCode string `json:"provinceCode"`
        PostalCode   string `json:"postalCode"`
        CountryCode  string `json:"countryCode"`
        IsPrimary    bool   `json:"isPrimary"`
    }

    type Phone struct {
        PhoneId         int    `json:"phoneId"`
        IdentityId      string `json:"identityId"`
        PhoneType       string `json:"phoneType"`
        CountryCallCode string `json:"countryCallCode"`
        CountryCode     string `json:"countryCode"`
        PhoneNumber     string `json:"phoneNumber"`
        Extension       string `json:"extension"`
        IsPrimary       bool   `json:"isPrimary"`
        IsMfa           bool   `json:"isMfa"`
        Verified        bool   `json:"verified"`
    }

    type Email struct {
        EmailId      int    `json:"emailId"`
        EmailAddress string `json:"emailAddress"`
        IsPrimary    bool   `json:"isPrimary"`
        IsVerified   bool   `json:"isVerified"`
        IdentityId   string `json:"identityId"`
    }

    type Register struct {
        FirstName         string `json:"firstName"`
        MiddleName        string `json:"middleName"`
        LastName          string `json:"lastName"`
        Email             string `json:"email"`
        UserName          string `json:"userName"`
        Password          string `json:"password"`
        SupportCode       string `json:"supportCode"`
        GotoUrl           string `json:"goToUrl"`
        TermsOfUse        string `json:"termsOfUse"`
        CreatedDate       string `json:"createdDate"`
        RecaptchaResponse string `json:"recaptchaResponse"`
        ProviderId        string `json:"providerId"`
    }

    type ServiceCardApplication struct {
        ApplicationId int                     `json:"applicationId"`
        Name          string                  `json:"name"`
        Organization  ServiceCardOrganization `json:"organization"`
        PolicyId      string                  `json:"policyId"`
    }

    type ServiceCardCallback struct {
        Files   []gosdkModels.ServiceCardFileDto  `json:"files"`
        Labels  []gosdkModels.ServiceCardLabelDto `json:"labels"`
        Actions []gosdkModels.ServiceCardTaskDto  `json:"actions"`
    }

    type ServiceCardContact struct {
        FirstName       string                      `json:"firstName,omitempty"`
        LastName        string                      `json:"lastName,omitempty"`
        Prefix          string                      `json:"prefix,omitempty"`
        Suffix          string                      `json:"suffix,omitempty"`
        Title           string                      `json:"title,omitempty"`
        EntityId        string                      `json:"entityId,omitempty"`
        Phone           ServiceCardContactPhone     `json:"phone,omitempty"`
        Phone2          ServiceCardContactPhone     `json:"phone2,omitempty"`
        Fax             ServiceCardContactPhone     `json:"fax,omitempty"`
        Email           string                      `json:"email,omitempty"`
        Url             string                      `json:"url,omitempty"`
        MailingAddress  ServiceCardAddress          `json:"mailingAddress,omitempty"`
        PhysicalAddress ServiceCardAddress          `json:"physicalAddress,omitempty"`
        PhotoUrl        string                      `json:"photoUrl,omitempty"`
        Type            string                      `json:"type,omitempty"`
        OrgUnit         ServiceCardOrganizationUnit `json:"orgUnit,omitempty"`
    }

    type ServiceCardContactList struct {
        CtaTitle     string `json:"ctaTitle,omitempty"`
        CtaUrl       string `json:"ctaUrl,omitempty"`
        ContactTitle string `json:"contactTitle,omitempty"`
        Contacts     []ServiceCardContact
    }

    type ServiceCardContactPhone struct {
        Prefix    string `json:"prefix,omitempty"`
        Number    string `json:"number,omitempty"`
        Extension string `json:"extension,omitempty"`
        Note      string `json:"note,omitempty"`
    }

    type ServiceCardAddress struct {
        Line       string `json:"line,omitempty"`
        City       string `json:"city,omitempty"`
        Province   string `json:"province,omitempty"`
        Country    string `json:"country,omitempty"`
        PostalCode string `json:"postalCode,omitempty"`
    }

    type ServiceCardOrganizationUnit struct {
        Name            string                  `json:"name,omitempty"`
        EntityId        string                  `json:"entityId,omitempty"`
        Phone           ServiceCardContactPhone `json:"phone,omitempty"`
        Phone2          ServiceCardContactPhone `json:"phone2,omitempty"`
        Fax             ServiceCardContactPhone `json:"fax,omitempty"`
        Email           string                  `json:"email,omitempty"`
        Url             string                  `json:"url,omitempty"`
        MailingAddress  ServiceCardAddress      `json:"mailingAddress,omitempty"`
        PhysicalAddress ServiceCardAddress      `json:"physicalAddress,omitempty"`
        PhotoUrl        string                  `json:"photoUrl,omitempty"`
        Type            string                  `json:"type,omitempty"`
    }

    type ServiceCardAdditionalDetails struct {
        ActionTitle string `json:"actionTitle,omitempty"`
        Description string `json:"description,omitempty"`
        Url         string `json:"url,omitempty"`
    }

    type ServiceCard struct {

        //The following are required for both ServiceCardDto and LightServiceCardDto
        IsPilot           bool   `json:"isPilot"`
        AutomationEnabled bool   `json:"automationEnabled"`
        ServiceCardId     string `json:"serviceCardId"`
        Title             string `json:"title"`
        ShortDescription  string `json:"shortDescription"`
        AdditionalDetail  string `json:"additionalDetail"`
        ServiceCardType   string `json:"serviceCardType"`

        //The following are not required and are a part of ServiceCardDto
        Saved                    bool                       `json:"saved,omitempty"`
        ActivePolicy             Policy                     `json:"activePolicy,omitempty"`
        BasicContentCallbackUrls []string                   `json:"basicContentCallbackUrls,omitempty"`
        Applications             []ServiceCardApplication   `json:"applications,omitempty"`
        Tasks                    []gosdk.ServiceCardTaskDto `json:"tasks,omitempty"`
    }

##########
Appendix B
##########

.. code-block:: go
   :linenos:

   	revel.TemplateFuncs["generic"] = func(obj map[string]string) map[string]interface{} {
		ret := make(map[string]interface{})
		for key, val := range obj {
			ret[key] = val
		}
		return ret
	}

	revel.TemplateFuncs["json"] = func(f interface{}) string {
		s, _ := json.MarshalIndent(f, "", "    ")
		return string(s)
	}

	revel.TemplateFuncs["doesFileDtoHaveFiles"] = func(f []gosdkModels.ServiceCardFileDto) bool {
		if len(f) < 0 {
			return true
		}
		return false
	}

	revel.TemplateFuncs["translate"] = func(viewArgs map[string]interface{}, key string) string {
		lang, ok := viewArgs[revel.CurrentLocaleViewArg].(string)
		if !ok {
			revel.AppLog.Warnf("unable to determine language, %s", viewArgs)
			lang = "en"
		}

		return language.Service.GetByKeyAndLang(lang, key)
	}

	revel.TemplateFuncs["map"] = func(obj interface{}) map[string]interface{} {
		return structs.Map(obj)
	}

	revel.TemplateFuncs["url_for"] = func(url string) string {
		return utils.UrlFor(url)
	}

	revel.TemplateFuncs["changeLanguage"] = func(url, currentLocale, targetLocale string) string {
		return strings.Replace(url, fmt.Sprintf("/%s/", currentLocale), fmt.Sprintf("/%s/", targetLocale), 1)
	}

	revel.TemplateFuncs["tmpl"] = func(parentContext map[string]interface{}, args ...interface{}) interface{} {
		var templateName = ""

		var viewArgs interface{}
		switch len(args) {
		case 0:
			revel.AppLog.Errorf("tmpl: No arguments passed to template call")
		case 1:
			templateName = args[0].(string)
		default:
			templateName = args[0].(string)
			viewArgs = args[1]
			if len(args) > 3 {
				revel.AppLog.Errorf("tmpl: Received more parameters then needed for", "template", templateName)
			}
		}

		viewArgsMap, ok := viewArgs.(map[string]interface{})
		if !ok {
			fmt.Printf("viewArgs is type %T, %+v", viewArgs, viewArgs)
			revel.AppLog.Error("tmpl: failed to convert to map", "name", templateName, "err", viewArgs)
		}
		for _, key := range []string{"_csrftoken", "currentLocale", "errors", "flash"} {
			if val, ok := parentContext[key]; ok {
				viewArgsMap[key] = val
			}
		}

		var buf bytes.Buffer
		tmpl, err := revel.MainTemplateLoader.Template(templateName)
		if err == nil {
			err = tmpl.Render(&buf, viewArgsMap)
			if err != nil {
				revel.AppLog.Error("tmpl: Failed to render", "name", templateName, "error", err)
			}
		} else {
			revel.AppLog.Error("i18ntemplate: Failed to render i18ntemplate ", "name", templateName, "error", err)
		}
		return template.HTML(buf.String())
	}

	revel.TemplateFuncs["html"] = func(t string) template.HTML {
		return template.HTML(t)
	}

	revel.TemplateFuncs["formatPhoneNumber"] = func(t string) string {
		return "(" + string(t[0:3]) + ") " + string(t[3:6]) + "-" + string(t[6:10])
	}

	revel.TemplateFuncs["extractParams"] = func(p []gosdkModels.ServiceCardTaskDto, csrf_token template.HTML) map[string]interface{} {
		revel.AppLog.Debugf("adding csfr_token to form submission %v", csrf_token)
		revel.AppLog.Debugf("Vivvo-Test %+v", p[0].Params)
		if len(p[0].Params) > 0 {
			p[0].Params["csrf_token"] = csrf_token
			return p[0].Params
		}
		return map[string]interface{}{
			"csrf_token": csrf_token,
		}
	}

	revel.TemplateFuncs["formatTime"] = func(t string) string {
		if len(t) > 0 {
			t = t[:strings.IndexByte(t, '.')] + "Z"
		}

		formatedTime, err := time.Parse(time.RFC3339, t)
		if err != nil {
			fmt.Println(err.Error())
			return t
		}
		return formatedTime.Format("02-Jan-06 15:04:05")
	}

	revel.TemplateFuncs["sortAndReverseMap"] = func(m map[string]string) *slicemultimap.MultiMap {
		s := slicemultimap.New()
		r := slicemultimap.New()

		for key, value := range m {
			s.Put(value, key)
		}
		var keys []string
		for _, key := range s.Keys() {
			keys = append(keys, key.(string))
		}
		sort.Strings(keys)
		for _, k := range keys {
			value, ok := s.Get(k)
			if ok {
				r.Put(k, value)
			}
		}
		return r
	}