# vext

A program to add, replace, or remove file extensions.

## Usage

```
> ls
// output:
// foo
> vext --add --file foo --extension txt
> ls
// output:
// foo.txt
> vext --replace --file foo.txt --extension v
> ls
// output:
// foo.v
> vext --remove --file foo.v
> ls
// output:
// foo
```

## Arguments

### ```--file``` or ```-f```

Path to the file(s) on which the extension will be manipulated. This argument **must** be enclosed in quotes if there are multiple files.

### ```--action``` or ```-a```

Action to do on the file. Options for this argument include 'add', 'remove', and 'replace'.

### ```--extension``` or ```-e```

The extension to add or replace to the file(s).

## Installation

```
> git clone https://github.com/vanillaiice/v-ext
> cd v-ext
> v .
// or
> make
```

## Development dependencies

- v
- make (optional)
- MinGW-w64 (optional, for windows cross compilation)

## Licence

BSD-3-Clause

## Author

Vanillaiice
