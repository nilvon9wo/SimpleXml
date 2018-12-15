public class SXML_TextSimpleNode implements SXML_SimpleNodeIntf {
    String nodeName;
    String content;

    public SXML_TextSimpleNode(String nodeName) {
        this.nodeName = nodeName;
    }

    public SXML_TextSimpleNode setContent(String content) {
        this.content = content;
        return this;
    }

    public Dom.XmlNode toXmlNode(Dom.XmlNode outerNode) {
        outerNode.addChildElement(this.nodeName, null, null);
        Dom.XmlNode innerNode = outerNode.getChildElement(this.nodeName, null)
            .addTextNode(this.content);
        return innerNode;
    }
}