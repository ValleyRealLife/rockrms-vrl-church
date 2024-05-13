When hiding a label, add a Pre-HTML with something like this:
```HTML
<label class="control-label">
    Please read our  <a href="http://storage.cloversites.com/valleyreallife/documents/Waiver%20VRL%20-%20Consent%20Form%20Winter%20Camp%202019_2.pdf" target="_blank">Parent/Guardian Consent/Liability Waiver</a> and indicate your agreement.
</label>
```

If required, nest it within a "form-group required" class like this:
```HTML
<span class="form-group required" style="margin-top: 12px;">
    <label class="control-label">
        Please read our  <a href="http://storage.cloversites.com/valleyreallife/documents/Waiver%20VRL%20-%20Consent%20Form%20Winter%20Camp%202019_2.pdf" target="_blank">Parent/Guardian Consent/Liability Waiver</a> and indicate your agreement.
    </label>
</span>
```