package org.jboss.windup.graph.model.performance;

import org.jboss.windup.graph.Property;
import org.jboss.windup.graph.model.WindupVertexFrame;

import com.tinkerpop.frames.modules.typedgraph.TypeValue;

/**
 * This stores the time it takes to execute all of the rules within a particular phase of execution.
 * 
 * @author jsightler <jesse.sightler@gmail.com>
 */
@TypeValue(RulePhaseExecutionStatisticsModel.TYPE)
public interface RulePhaseExecutionStatisticsModel extends WindupVertexFrame
{
    public static final String RULE_PHASE = "rulePhase";
    public static final String TYPE = "RulePhaseExecutionStatisticsModel";
    public static final String TIME_TAKEN = "timeTaken";

    /**
     * The phase represented by this model.
     */
    @Property(RULE_PHASE)
    public RulePhaseExecutionStatisticsModel setRulePhase(String phase);

    /**
     * The phase represented by this model.
     */
    @Property(RULE_PHASE)
    public String getRulePhase();

    /**
     * The time taken for all of the rules within this phase (in milliseconds)
     */
    @Property(TIME_TAKEN)
    public RulePhaseExecutionStatisticsModel setTimeTaken(int timeTakenMillis);

    /**
     * The time taken for all of the rules within this phase (in milliseconds)
     */
    @Property(TIME_TAKEN)
    public int getTimeTaken();
}
