Growthbeat wrapper module for Titanium
===========================================

+ *Now support for iOS Only*

REGISTER YOUR MODULE
--------------------

Register your module with your application by editing `tiapp.xml` and adding your module.
Example:

<modules>
    <module version="1.0">net.ikmz.tigrowthbeat</module>
</modules>

When you run your project, the compiler will combine your module along with its dependencies
and assets into the application.


USING YOUR MODULE IN CODE
-------------------------

To use the module in code, you will need to require it.

### Initialization

To use the module, you will need to Initialization in alloy.js or other file.

```
Alloy.Globals.Growthbeat = require('net.ikmz.tigrowthbeat');
Alloy.Globals.Growthbeat.init({
    applicationId: "<applicationId>",
    credentialId: "<credentialId>"
});
```

### register device token

When you get device token, you will need to send token.
In general, you will write following code.

```
Ti.Network.registerForPushNotifications({
  success: function(e){
    Growthbeat.setDeviceToken({deviceToken: e.deviceToken});
  },
});
```

LICENSE
-------------------------
MIT License.


Cheers!
