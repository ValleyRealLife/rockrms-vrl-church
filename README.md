# rock-vrl-church
Tim created this repository in order to contain all the things about VRL's Rock implementation that could be shared externally and collaborated on.

I like the idea of [CodeTour](https://code.visualstudio.com/learn/educators/codetour), this is a VSC Extension that will allow the code author to give you a "tour" of their code. Essentially, it's like adding comments to your code, but differently. I will try to get in the habit of creating CodeTours for codes that could be confusing without context/explanation. ([VSC Marketplace: CodeTour Extension](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour))

# How to Use this Repository
1. The [Material Icon Theme](https://marketplace.visualstudio.com/items?itemName=PKief.material-icon-theme) is recommended.
2. The [CodeTour](https://marketplace.visualstudio.com/items?itemName=vsls-contrib.codetour) Extension is recommended.
3. Inside the `_code` Folder,
   1. the Folders where the name begins with an underline is akin to footnotes or margin-notes.
   2. the other Folders try to denote an Entity or Context where the code snippet is used.
      - For the sake of making it easier to navigate in GitHub, each Folder should have its own README.
      - Each Lava file should start with a comment block that denotes where this snippet is being used. See 'Lava Header Examples' below.

# Lava Header Example
## Header for files in this GitHub Repo
The Lava file in this GitHub repo should begin with a comment block like this:
```
/------------------------------------------------------------
    This Lava is found in
    RegistrationTemplateId=93, [Terms/Text] > Registration Confirmation Text
------------------------------------------------------------/
```

If the Lava file was created by copy+pasting an existing Lava Template (maybe it was written by SparkDev or Triumph in core Rock), then please make note of it like this:
```
/------------------------------------------------------------
    This Lava is found in
    RegistrationTemplateId=93, [Terms/Text] > Registration Confirmation Text

    I am copy+pasting this here from the VRL Rock Site.
    I copy+pasted this on 09-APR-2024
------------------------------------------------------------/
```

## Header for Lava in our Rock instance
Similarly, the corresponding location in Rock should have its Lava Template begin with a comment block like this:
```
/------------------------------------------------------------
    GitHub
    rockrms-vrl-church/blob/main/_code/RegistrationTemplates/NextGen_Camp/01_RegistrationTemplate/RegistrationConfirmationText.lava
------------------------------------------------------------/
```

<hr>
