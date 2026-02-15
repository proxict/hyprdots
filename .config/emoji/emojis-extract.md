# Go to this page:
https://unicode-org.github.io/emoji/emoji/charts-15.0/emoji-list.html

# Open devtools and paste this code into the console:
```js
[...document.querySelectorAll('body > div.main > table > tbody > tr')]
  .map(tr => {
    const cells = tr.querySelectorAll('td');
    const codepoint = cells[1]?.querySelector('a')?.attributes?.name?.value;
    const emoji = cells[2]?.querySelector('a > img')?.attributes?.alt?.value;
    const shortname = cells[3]?.textContent;
    const keywords = cells[4]?.textContent;
    return (codepoint && emoji && shortname && keywords) ? { codepoint, emoji, shortname, keywords } : null;
  }).filter((e) => e);
```

# You can then copy the object it spits out

# Convert to a simple text file:
```bash
jq -r '.[] | "\(.emoji) \(.shortname) \(.keywords)"'  'emojis.json' > emojis.txt
```

