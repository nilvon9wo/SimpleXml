public class SXML_EmptySimpleNode implements SXML_SimpleNodeIntf {
    String nodeName;

    public SXML_EmptySimpleNode(String nodeName) {
        this.nodeName = nodeName;
    }

    public Dom.XmlNode toXmlNode(Dom.XmlNode outerNode) {
        outerNode.addChildElement(this.nodeName, null, null);
        return outerNode.getChildElement(this.nodeName, null);
    }
}