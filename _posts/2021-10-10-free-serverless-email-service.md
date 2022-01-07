---
layout: single
title:  "Free* Serverless Email Service in 20 minutes"
date:   2021-10-10
categories: posts
tags: devops aws ses email service

toc: true
toc_sticky: true
toc_label: Table of Contents

excerpt: >-
  Eventually you will require a professional-grade email address.
  What are the options and pricing? Can this service be Free?

---
## Preamble

![post-logo-ncp](/assets/images/startup/serverless-email-service/post-logo-ncp.png)

Hi everyone,

Sooner or later every Company, Startup or even individual will require a professional-looking email address.

Since every bit of email you send or receive has to live somewhere, it means you need a Server or a Service that will house it.

So what are our options?

Let's review some of them.

-----

## Email Server/Service Market

### Self-hosted Way

We could go with:

* old-style self-hosted Postfix/Dovecot setup
* or something cooler like [mailu.io](https://mailu.io/1.8/){:target="_blank"}
* or [docker-mailserver](https://github.com/docker-mailserver/docker-mailserver){:target="_blank"}

Of course with all underlining headache of maintenance, compliances, compute power required to run it and so on.

Not cool in the Age of SaaS!

Plus it is 2021, so there 's gotta be cheap solutions out there, right?

-----

### Hosting-Based Way

There is a wide variety of Hosting Providers that will range from **7-20 USD/mo for 5 users** at the moment.

Of course, usually it means you 'll need to buy a whole package: shared hosting, maybe virtual private server(vps) and other unnecessary bunch of stuff.

-----

### Cloud-Based Way

* [protonmail](https://protonmail.com/business/pricing){:target="_blank"} will charge you **45 USD/mo for 5 users** at the moment
* [Gsuite Business Starter](https://workspace.google.com/intl/en/pricing.html){:target="_blank"} will charge you **30 USD/mo for 5 users** at the moment

-----

### Domain-Providers Way

That's kinda interesting, as i've never paid attention they provide such service, but for example **GoDaddy** [actually does](https://uk.godaddy.com/email/professional-business-email){:target="_blank"}.

At the end, you 'll pay around **15 USD/mo per 5 users** and gonna use Microsoft Teams to access it.

-----
### Conclusion

Sure those are not crazy numbers, however, for some brave but poor Startup or individual, this might become an unwanted spending.

Can we find a even cheaper solution or...**not to pay at all**? :smirk:

Turns out you can.

-----

## Amazon SES

[Amazon SES](https://aws.amazon.com/ses/){:target="_blank"} stands for Simple Email Service, it is obviously Cloud-Based and removes all the hustle with managing its underlining infrastructure.

Naturally, it can send emails but most importantly - **receive** them as well.

SES is also [very kind](https://aws.amazon.com/ses/pricing/){:target="_blank"} in terms of pricing:

![pricing](/assets/images/startup/serverless-email-service/2-ses-pricing.png)

Except for similar ["0x4447_product_s3_email"](https://github.com/0x4447/0x4447_product_s3_email){:target="_blank"} project and bits and pieces across the web, I haven't found modern solution, so i've took the liberty [creating it](https://github.com/leshcat/serverless-email-service){:target="_blank"} myself :smirk:

Let's see it in action!

-----

### Preparation

For starters, let's get the [repo](https://github.com/leshcat/serverless-email-service){:target="_blank"}:

```bash
% git clone https://github.com/leshcat/serverless-email-service.git
% cd serverless-email-service
```

According to [README](https://github.com/leshcat/serverless-email-service/blob/main/README.md){:target="_blank"}, we should go through next steps:

* [Create accounts & install binaries](https://github.com/leshcat/serverless-email-service#prerequisites){:target="_blank"}
* [Remove SES from "Sandbox"](https://github.com/leshcat/serverless-email-service#production-ses){:target="_blank"} for ability to send emails everywhere

  Basically, you are obliged to write a short Support Ticket explaining how exactly you are going to use your SES.

  Once done, soon enough Amazon guys will review your request and your SES state will switch from "Sandbox":

  ![ses-sandbox](/assets/images/startup/serverless-email-service/2-ses-sandbox.png)

  to a Proud "Production" state:

  ![ses-production](/assets/images/startup/serverless-email-service/2-ses-prod-ready.png)

* [Export environment variables](https://github.com/leshcat/serverless-email-service#environment-variables){:target="_blank"}

* [Create an S3 bucket for Terraform remote state storage](https://github.com/leshcat/serverless-email-service#environment-variables){:target="_blank"} you've provided in variable in step above

  For my trial run, I 've chosen following name for my S3 bucket:

  `ldhq-us-east-1-ses-tfstate`

* [Modify Terraform variables](https://github.com/leshcat/serverless-email-service#terraform-variables){:target="_blank"}

  Here is my choice:

  ```bash
  % cp us-east-1.tfvars.example us-east-1.tfvars
  % cat us-east-1.tfvars
  ```
  ```bash
  config = {
    "ldhq.io" : {
      fromEmail : "aws-ses-lambda-forwarder@ldhq.io",
      emailBucket : "us-east-1-ldhq.io-ses",
      emailKeyPrefix : "emails/",
      forwardMapping : {
        "luckydoge@ldhq.io" : [
          "my.gmail.account@gmail.com"
        ],
        "benita@ldhq.io" : [
          "my.other.gmail.account@gmail.com"
        ]
      }
    }
  }
  ```

### Installation

Okay, looks like we are all set!

As [README](https://github.com/leshcat/serverless-email-service#install){:target="_blank"} claims, all i need to do is to execute single command:

```bash
% make
```

If you did everything right, within a minute or so, Terraform will complete its work.

Check your `"./outputs"` folder for DNS Verification Records and SES Credentials.

### Updating your Domain DNS Configuration

Lets check DNS Verification Records:

```bash
jq . ./outputs/326278417061-us-east-1-dns-records.txt
```
```json
{
  "ldhq.io": {
    "dkim-0": {
      "name": "<redacted>._domainkey",
      "record": "<redacted>.dkim.amazonses.com",
      "ttl": "600",
      "type": "CNAME"
    },
    "dkim-1": {
      "name": "<redacted>._domainkey",
      "record": "<redacted>.dkim.amazonses.com",
      "ttl": "600",
      "type": "CNAME"
    },
    "dkim-2": {
      "name": "<redacted>._domainkey",
      "record": "<redacted>.dkim.amazonses.com",
      "ttl": "600",
      "type": "CNAME"
    },
    "verification": {
      "name": "_amazonses.ldhq.io",
      "record": "<redacted>",
      "ttl": "600",
      "type": "TXT"
    }
  }
}
```

Following records should be set in the DNS configuration for your domain.

More information on how to do that for various Domain providers can be [found here](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-authentication-dkim-easy-setup-domain.html){:target="_blank"}.

**NOTE**: If you are using **GoDaddy** like me, you need to drop the domain apex from verification record, just like [inkplant's "amazon-ses-godaddy"](https://inkplant.com/code/amazon-ses-godaddy){:target="_blank"} post noted.

You can check your domain's records via [mxtoolbox](https://mxtoolbox.com/dkim.aspx){:target="_blank"} or [dmarcanalyzer](https://www.dmarcanalyzer.com/how-to-validate-a-domainkey-dkim-record/){:target="_blank"}, example:

![dkim-check](/assets/images/startup/serverless-email-service/3-dkim-check.png)

Once your records propagate, it takes approx ~10 minutes for domain to change status from Pending:

![verification-pending](/assets/images/startup/serverless-email-service/2-ses-verification-pending.png)

To Verified state:

![verification-completed](/assets/images/startup/serverless-email-service/2-ses-verified.png)

### Email Address setup in Gmail account

Next, its time to update Gmail with following creds:

```bash
jq . ./outputs/326278417061-us-east-1-ses-credentials.txt
```

```json
{
  "smtp_server": {
    "name": "email-smtp.us-east-1.amazonaws.com",
    "port": "587"
  },
  "us-east-1-benita@ldhq.io": {
    "email": "benita@ldhq.io",
    "login": "AKIA<redacted>",
    "password": "BLWMr<redacted>"
  },
  "us-east-1-luckydoge@ldhq.io": {
    "email": "luckydoge@ldhq.io",
    "login": "AKIA<redacted>",
    "password": "BFans<redacted>"
  }
}
```

Simply follow [this part of README](https://github.com/leshcat/serverless-email-service#email-address-setup-in-gmail-account){:target="_blank"} to add your new and shiny Email Addresses.

## Testing Time!

Lets send an email from `"luckydoge@ldhq.io"` to some other user:

![6-outgoing-email-to-ext-sent](/assets/images/startup/serverless-email-service/6-outgoing-email-to-ext-sent.png)

As you can see, we've got it:

![6-outgoing-email-to-ext-received](/assets/images/startup/serverless-email-service/6-outgoing-email-to-ext-received.png)

People respecting Doge always write a reply. And here is the final result:

![6-outgoing-email-to-ext-received](/assets/images/startup/serverless-email-service/6-incoming-mail-from-ext-received-full.png)

Works like charm :smirk:

## Being Free* & Prod-Grade solution

As of time of writing this post, Amazon Billing Dashboard forecasted 0.00 USD for the end of month and reported plenty of Free Tier resources available:

![pricing](/assets/images/startup/serverless-email-service/5-pricing-results.png)

Unless you are sending thousands of mails per day with 4K videos attached (not to worry, [limits](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/limits.html){:target="_blank"} won't allow that), you 'll probably never pay a dime for months to come.

:fire: However! :fire:

Serverless Email Service **should not be considered Production-Grade solution for Companies larger than ~5-7 users**, as budget predictability becomes uncertain and overall control is basically limited.

If your Company or Startup rapidly extends the numbers of employees, in my opinion it's best to consider paid alternatives provided above.

Anyway, it's up to you :slightly_smiling_face:.

## Conclusion

In less than 20 minutes, we have created a Serverless Email Service that requires no maintenance and slim-to-none cost!

Target goal achieved :wink:

Stay Frosty,

L.
