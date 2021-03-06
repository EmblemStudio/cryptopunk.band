//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Bands is ERC721Enumerable, ReentrancyGuard, Ownable {

    string[] private adjectives = [
        "aliased",
        "alien",
        "ambient",
        "angelic",
        "agnostic",
        "anonymous",
        "anti",
        "automatic",
        "bad",
        "bankrupt",
        "barefoot",
        "basic",
        "beat",
        "beautiful",
        "beloved",
        "better",
        "big",
        "bitter",
        "black",
        "blank",
        "blind",
        "blue",
        "bold",
        "bratty",
        "brave",
        "brief",
        "brutal",
        "burning",
        "busy",
        "caustic",
        "cheap",
        "cinnamon",
        "circular",
        "clever",
        "cold",
        "cool",
        "complex",
        "confused",
        "criminal",
        "crossed",
        "cruel",
        "dancing",
        "dark",
        "deadly",
        "deep",
        "distant",
        "double",
        "dry",
        "easy",
        "ecstatic",
        "effulgent",
        "electric",
        "fabulous",
        "fancy",
        "fast",
        "first",
        "fizzy",
        "fluffy",
        "folk",
        "foolish",
        "frozen",
        "fuzzy",
        "goddamn",
        "ghost",
        "giant",
        "glowing",
        "good",
        "greasy",
        "green",
        "grey",
        "groovy",
        "happy",
        "hated",
        "hilarious",
        "hip",
        "hopeful",
        "hot",
        "human",
        "hysterical",
        "idle",
        "indie",
        "industrial",
        "iron",
        "jealous",
        "joking",
        "joyous",
        "kafkaesque",
        "keen",
        "key",
        "killing",
        "kind",
        "kinesthetic",
        "kooky",
        "last",
        "latex",
        "limp",
        "little",
        "logical",
        "lonesome",
        "loose",
        "loving",
        "loud",
        "lumpy",
        "mad",
        "magical",
        "major",
        "manic",
        "meta",
        "metallic",
        "mindless",
        "minor",
        "musical",
        "naked",
        "national",
        "nebulous",
        "negative",
        "neon",
        "new",
        "noble",
        "noisy",
        "numb",
        "oblique",
        "oily",
        "orange",
        "oscillating",
        "outer",
        "pink",
        "plastic",
        "polar",
        "pop",
        "punk",
        "purple",
        "quick",
        "raw",
        "regular",
        "real",
        "residual",
        "sad",
        "sarcastic",
        "savage",
        "secret",
        "second",
        "scary",
        "schizoid",
        "scrambled",
        "sexy",
        "sharp",
        "shaved",
        "shining",
        "silent",
        "silly",
        "silver",
        "simple",
        "single",
        "slimy",
        "sloppy",
        "smart",
        "soft",
        "sonic",
        "space",
        "special",
        "spicy",
        "stark",
        "starving",
        "stiff",
        "still",
        "strange",
        "sub",
        "substitute",
        "steel",
        "strong",
        "super",
        "sweet",
        "talking",
        "teenage",
        "tiny",
        "total",
        "toxic",
        "tragic",
        "tricky",
        "triple",
        "tropical",
        "union",
        "untold",
        "unkempt",
        "unknown",
        "urgent",
        "useless",
        "vampire",
        "velvet",
        "violet",
        "visceral",
        "voodoo",
        "wet",
        "white",
        "whomping",
        "x-ray",
        "yellow",
        "young",
        "zombie",
                                   ];
    string[] private nouns = [
        "airplane",
        "alias",
        "alien",
        "angel",
        "ant",
        "anthem",
        "apple",
        "argument",
        "art",
        "ass",
        "atom",
        "bat",
        "bear",
        "beat",
        "beast",
        "bee",
        "being",
        "bike",
        "bicycle",
        "bird",
        "bleach",
        "book",
        "boot",
        "booty",
        "bowl",
        "boy",
        "brain",
        "brat",
        "breast",
        "brute",
        "bug",
        "building",
        "business",
        "butt",
        "butter",
        "carpet",
        "cat",
        "chain",
        "cheese",
        "church",
        "city",
        "coffee",
        "color",
        "country",
        "cowboy",
        "damage",
        "day",
        "death",
        "device",
        "disease",
        "dog",
        "doll",
        "dolphin",
        "door",
        "dove",
        "drum",
        "eagle",
        "egret",
        "embrace",
        "ethic",
        "eye",
        "face",
        "fairy",
        "ferret",
        "field",
        "finger",
        "fire",
        "fish",
        "flag",
        "flower",
        "force",
        "formula",
        "fox",
        "fruit",
        "fucker",
        "garage",
        "genius",
        "ghost",
        "giant",
        "girl",
        "gorilla",
        "hammer",
        "hat",
        "head",
        "heart",
        "hobo",
        "holiday",
        "hour",
        "house",
        "human",
        "idol",
        "iron",
        "jackknife",
        "jaw",
        "joke",
        "joy",
        "judge",
        "key",
        "king",
        "kiss",
        "knot",
        "knuckle",
        "lamb",
        "laughter",
        "law",
        "life",
        "lion",
        "lip",
        "lizard",
        "lock",
        "loop",
        "lord",
        "love",
        "machine",
        "map",
        "metal",
        "minute",
        "monkey",
        "monster",
        "nation",
        "neck",
        "orb",
        "orbit",
        "order",
        "organ",
        "otter",
        "paint",
        "panda",
        "peace",
        "pelvis",
        "pencil",
        "pigeon",
        "plastic",
        "poem",
        "point",
        "pole",
        "power",
        "prince",
        "princess",
        "pulley",
        "punk",
        "quail",
        "queen",
        "quiz",
        "rainbow",
        "rat",
        "raygun",
        "robot",
        "rock",
        "rocket",
        "saw",
        "shark",
        "ship",
        "shirt",
        "shoe",
        "sister",
        "skateboard",
        "skull",
        "sky",
        "slime",
        "space",
        "squirrel",
        "star",
        "steel",
        "summer",
        "sweat",
        "teen",
        "television",
        "theory",
        "thing",
        "thorax",
        "thump",
        "tiger",
        "toe",
        "tool",
        "torso",
        "traffic",
        "tree",
        "truck",
        "turkey",
        "uncle",
        "union",
        "unicorn",
        "vampire",
        "vegetable",
        "vulture",
        "wall",
        "water",
        "wave",
        "winter",
        "wolverine",
        "word",
        "world",
        "x",
        "yard",
        "year",
        "youth",
        "zebra",
        "zero",
        "zombie",
                              ];

    string[] private instruments [
                                  "guitar",
                                  "bass",
                                  "drums",
                                  "vocals",
                                  ];

    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    function getAdjective(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "ADJECTIVE", adjectives);
    }

    function getNoun(uint256 tokenId) public view returns (string memory) {
        return pluck(tokenId, "NOUN", nouns);
    }

    function pluck(uint256 tokenId, string memory keyPrefix, string[] memory sourceArray) internal view returns (string memory) {
        uint256 rand = random(string(abi.encodePacked(keyPrefix, toString(tokenId))));
        string memory output = sourceArray[rand % sourceArray.length];
        return output;
    }

    function getMember(uint256 tokenId, uint256 memberNumber) internal view returns (string memory) {
        uint256 punk = random(string(abi.encodePacked(toString(memberNumber), toString(tokenId)))) % 10000;
        string memory instrument = pluck(tokenId, "INSTRUMENT", instruments);
        if (punk % 7 == 0) {
            instrument = string(abi.encodePakcked(instrument, " & ", pluck(tokenId, "SECOND_INSTRUMENT", instruments)));
        }
        if (punk % 113 == 0) {
            instrument = string(abi.encodePakcked(instrument, " & ", pluck(tokenId, "THIRD_INSTRUMENT", instruments)));
        }
        string memory output = string(abi.encodePacked(
            "\"punk\":\"", punk, "\",\"instrument\":\"", instrument "\""
        ));
        return output;
    }

    function tokenURI(uint256 tokenId) override public view returns (string memory) {
        string memory output = string(abi.encodePacked(
            "{\"name\":\"", getAdjective(tokenId), " ", getNoun(tokenId), "\","
        ));
        output = string(abi.encodePacked(output,
            "\"description\":\"CryptoPunk Bands are randomized bands (for CryptoPunks) generated and stored on chain. Music, images, and other functionality are intentionally omitted for others to interpret. Feel free to use CryptoPunk Bands in any way you want.\","
        ));
        output = string(abi.encodePacked(output,
            "\"members\":", getMembers(tokenId), "}"
        ));

        string memory json = Base64.encode(bytes(string(abi.encodePacked(output))));
        output = string(abi.encodePacked('data:application/json;base64,', json));

        return output;
    }

    function claim(uint256 tokenId) public nonReentrant {
        require(tokenId > 0 && tokenId < 9778, "Token ID invalid");
        _safeMint(_msgSender(), tokenId);
    }

    function ownerClaim(uint256 tokenId) public nonReentrant onlyOwner {
        require(tokenId > 9777 && tokenId < 10001, "Token ID invalid");
        _safeMint(owner(), tokenId);
    }

    function toString(uint256 value) internal pure returns (string memory) {
    // Inspired by OraclizeAPI's implementation - MIT license
    // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    constructor() ERC721("Bands", "BANDS") Ownable() {}
}
