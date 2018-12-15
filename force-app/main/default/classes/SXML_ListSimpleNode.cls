public class SXML_ListSimpleNode implements SXML_SimpleNodeIntf {
    String nodeName;
    List<SXML_SimpleNodeIntf> contentList;

    public SXML_ListSimpleNode(String nodeName, List<SXML_SimpleNodeIntf> contentList) {
        this.nodeName = nodeName;
        this.contentList = contentList;
    }

    public Dom.XmlNode toXmlNode(Dom.XmlNode outerNode) {
        outerNode.addChildElement(this.nodeName, null, null);
        Dom.XmlNode innerNode = outerNode.getChildElement(this.nodeName, null);
        for (SXML_SimpleNodeIntf content : contentList) {
            content.toXmlNode(innerNode);
        }
        return innerNode;
    }
}